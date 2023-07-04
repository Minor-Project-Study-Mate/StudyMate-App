import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/signup_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final controller = Get.put(SignUpController());

  @override
  void dispose() {
    Get.delete<SignUpController>(force: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => Scaffold(
          appBar: AppBar(
            title: Text(
              'Sign Up',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w400,
                  letterSpacing: BorderSide.strokeAlignInside,
                  color: Colors.white,
                ),
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.indigo.shade800,
          ),
          body: Container(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              key: controller.formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 20.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Hey there,',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontStyle: FontStyle.normal,
                                letterSpacing: BorderSide.strokeAlignInside,
                              ),
                            ),
                            const Text(
                              'Create an Account',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                letterSpacing: BorderSide.strokeAlignInside,
                              ),
                            ),
                            const SizedBox(height: 24.0),
                            TextFormField(
                              controller: controller.nameController,
                              validator: controller.nameValidator,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                hintText: 'Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                prefixIcon: const Icon(Icons.person),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            TextFormField(
                              controller: controller.emailController,
                              validator: controller.emailValidator,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                prefixIcon: const Icon(Icons.email),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            TextFormField(
                              // obscureText: true,
                              controller: controller.passwordController,
                              validator: controller.passwordValidator,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                prefixIcon: const Icon(Icons.lock),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            TextFormField(
                              // obscureText: true,
                              controller: controller.confirmPasswordController,
                              validator: controller.confirmPasswordValidator,
                              decoration: InputDecoration(
                                hintText: 'Confirm Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                prefixIcon: const Icon(Icons.lock),
                              ),
                            ),
                            const SizedBox(height: 24.0),
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xff3B3B98),
                                      Color(0xff0072B5)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ElevatedButton(
                                  onPressed: () => controller.signUp(),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 6.0,
                                      horizontal: 24.0,
                                    ),
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
