import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_mate/app/services/auth/auth_service.dart';

import '../../../routes/app_pages.dart';
import '../../../services/box/box_service.dart';

class ProfileController extends GetxController {
  final boxService = Get.find<BoxService>();
  final authService = Get.find<AuthServices>();

  Future<void> toggleThemeMode(ThemeMode themeMode) async =>
      await boxService.themeBox.changeThemeMode(themeMode);

  Future<void> logout() async {
    await authService.logout();
    Get.offAllNamed(Routes.INTRO);
  }
}
