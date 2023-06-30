import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:study_mate/app/services/box/box_service.dart';

import '../../../routes/app_pages.dart';
import '../../../services/auth/auth_service.dart';
import '../../../services/firebase/firebase_service.dart';
import '../../../services/firebase/model/app_user_model.dart';

class SignUpController extends GetxController {
  final _authService = Get.find<AuthService>();
  final firebaseService = Get.find<FirebaseService>();

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your name";
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    }
    return null;
  }

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please confirm your password";
    }
    if (value != passwordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      try {
        final res = await _authService.createUser(
          nameController.text,
          emailController.text,
          passwordController.text,
        );
        if (res != null) {
          await _updateAppUser(res);
          Get.offAllNamed(Routes.HOME);
        }
      } on FirebaseAuthException catch (e) {
        Get.snackbar(
          'Erro ao criar conta',
          e.message!,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  Future<void> _updateAppUser(User user) async {
    final res = await firebaseService.userDatasources.getMe(user.email!);
    await Get.find<BoxService>().appUser.updateAppUser(res);
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
