import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPasswordView> {
  final key = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final homeController = Get.find<AuthController>();

  final loading = false.obs;

  @override
  void dispose() {
    emailController.dispose();
    loading.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Forget Password'),
        ),
        body: Container(
          padding: const EdgeInsets.all(25.0),
          child: Card(
              child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Hey there,',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Enter your email address to reset your password',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (!key.currentState!.validate()) return;

                        loading.value = true;

                        homeController.resetPassword(
                          emailController.text,
                        );

                        loading.value = false;
                      },
                      child: loading.value
                          ? const SizedBox(
                              height: 18,
                              width: 18,
                              child: CircularProgressIndicator(),
                            )
                          : const Text('Send Reset Link'),
                    ),
                  ),
                ],
              ),
            ),
          )),
        ));
  }
}
