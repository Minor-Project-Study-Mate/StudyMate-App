import 'package:flutter/material.dart' show ThemeMode;
import 'package:get/get.dart';
import 'package:study_mate/app/services/auth/auth_service.dart';
import 'package:study_mate/app/services/box/box_service.dart';

import '../../../services/box/models/app_user.dart';

class TestPageController extends GetxController {
  final authServices = Get.find<AuthServices>();
  final cacheService = Get.find<BoxService>();
  final appUser = Rx<AppUser?>(null);

  @override
  void onInit() {
    appUser.value = cacheService.appUser.appUser;
    super.onInit();
  }

  Future<void> googleSignIn() async {
    try {
      final res = await authServices.googleSignIn();
      if (res != null) {
        appUser.value = res.fromGoogleSignInAccount;
      } else {
        Get.snackbar("Error 002", "Error on SignIn");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> logout() async {
    try {
      await authServices.logout();
      appUser.value = null;
    } catch (e) {
      print(e);
    }
  }

  Future<void> toggleThemeMode(ThemeMode themeMode) async =>
      await cacheService.theme.changeThemeMode(themeMode);
}
