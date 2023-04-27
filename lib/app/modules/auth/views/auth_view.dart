import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:study_mate/app/global/widgets/card_box.dart';
import 'package:study_mate/app/modules/auth/views/SignupPage.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(50))),
          child: Column(
            children: [Image.asset("assets/images/Intro.png")],
          ),
        ),
        Container(
          color: Colors.blue,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                )),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        'Welcome Back',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CardBox(
                  elevation: 20,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 35),
                        child: Column(
                          children: [
                            TextField(
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade200,
                                  filled: true,
                                  hintText: " Enter your Email",
                                  prefixIcon: const Icon(Icons.email,
                                      color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  )),
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              style: const TextStyle(),
                              obscureText: true,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade200,
                                  filled: true,
                                  hintText: "Enter your Password",
                                  prefixIcon: const Icon(Icons.lock,
                                      color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  )),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: RawMaterialButton(
                                  fillColor: Colors.blue,
                                  elevation: 0.0,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 0.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  onPressed: () => controller.fakeSignIn(),
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Have an account?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                Text(
                                  '- OR -',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  'Sign in with',
                                )
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () => controller.googleSignIn(),
                                  child: Container(
                                    height: 40.0,
                                    width: 40.0,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0, 2),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                    ),
                                    child: Image.asset(
                                      "assets/images/Google.png",
                                      height: 20,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // code for Facebook login
                                  },
                                  child: Container(
                                    height: 40.0,
                                    width: 40.0,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0, 2),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                    ),
                                    child: Image.asset(
                                      "assets/images/Facebook.png",
                                      height: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Get.to(SignUpPage());
                                  },
                                  style: const ButtonStyle(),
                                  child: const Text(
                                    'Sign Up',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 18),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Forgot Password',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    )),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
