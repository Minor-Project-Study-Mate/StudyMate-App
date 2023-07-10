import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_mate/app/global/widgets/card_box.dart';
import 'package:study_mate/app/modules/auth_page/views/signup_view.dart';

import '../controllers/auth_controller.dart';
import 'forget_password_view.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff3B3B98), Color(0xff0072B5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(50)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    child: Hero(
                      tag: "app_logo",
                      child: SvgPicture.asset(
                        'assets/svg/logo.svg',
                        height: 150,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 5, 80, 160),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                    )),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Text(
                            'Welcome Back',
                            style: GoogleFonts.lobster(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onBackground,
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
                            child: Form(
                              key: controller.key,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: controller.emailController,
                                    validator: controller.validateEmail,
                                    decoration: InputDecoration(
                                        filled: true,
                                        hintText: " Enter your Email",
                                        prefixIcon: const Icon(
                                          Icons.email,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        )),
                                  ),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    obscureText: true,
                                    controller: controller.passwordController,
                                    validator: controller.validatePassword,
                                    decoration: InputDecoration(
                                        filled: true,
                                        hintText: "Enter your Password",
                                        prefixIcon: const Icon(Icons.lock),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        )),
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    width: double.infinity,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xff3B3B98),
                                            Color(0xff0072B5),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: RawMaterialButton(
                                        fillColor: Colors.transparent,
                                        elevation: 0.0,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 0.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(9),
                                        ),
                                        onPressed: () =>
                                            controller.emailSignIn(),
                                        child: Obx(
                                          () => controller.loading.value
                                              ? const SizedBox(
                                                  height: 18,
                                                  width: 18,
                                                  child:
                                                      CircularProgressIndicator())
                                              : Text(
                                                  "Login",
                                                  style: GoogleFonts.arimo(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Have an account?',
                                        style: GoogleFonts.zillaSlab(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                        ),
                                      ),
                                      const SizedBox(height: 20.0),
                                      Text(
                                        '- OR -',
                                        style: GoogleFonts.roboto(
                                          fontSize: 17,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                      Text(
                                        'Sign in with',
                                        style: GoogleFonts.roboto(
                                          fontSize: 17,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 10.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                                    ],
                                  ),
                                  const SizedBox(height: 30.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: () =>
                                            Get.to(() => const SignUpPage()),
                                        style: const ButtonStyle(),
                                        child: Text(
                                          'Sign Up',
                                          style: GoogleFonts.zillaSlab(
                                            fontSize: 20,
                                            decoration:
                                                TextDecoration.underline,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () => Get.to(
                                              () => const ForgetPasswordView()),
                                          child: Text(
                                            'Forgot Password',
                                            style: GoogleFonts.zillaSlab(
                                              fontSize: 20,
                                              decoration:
                                                  TextDecoration.underline,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground,
                                            ),
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
