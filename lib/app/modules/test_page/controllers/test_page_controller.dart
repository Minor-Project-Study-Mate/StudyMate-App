import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show ThemeMode;
import 'package:get/get.dart';
import 'package:study_mate/app/services/auth/auth_service.dart';
import 'package:study_mate/app/services/box/box_service.dart';

class TestPageController extends GetxController {
  final authService = Get.find<AuthService>();
  final boxService = Get.find<BoxService>();

  String get userName => authService.displayName ?? "No Name";
  String get userEmail => authService.email ?? "No Email";

  Future<void> googleSignIn() async {
    try {
      final res = await authService.googleSignIn();
      if (res != null) {
      } else {
        Get.snackbar("Error 002", "Error on SignIn");
      }
      // ignore: empty_catches
    } catch (e) {}
  }

  void printUser() {
    Get.snackbar("", (authService.user.value ?? "Null").toString());
  }

  Future<void> logout() async {
    try {
      await authService.logout();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> toggleThemeMode(ThemeMode themeMode) async =>
      await boxService.themeBox.changeThemeMode(themeMode);

  getNoticeList() {
    // FirebaseService firebaseService = Get.find<FirebaseService>();
    // firebaseService.noticeEventDatasource.readEvent();
  }

  createEvent() {
    // final firebaseService = Get.find<FirebaseService>();
    // final event = Event(
    //   title: "title 2",
    //   description: "description 2",
    //   date: "date 2",
    //   time: "time 2",
    // );
    // firebaseService.noticeEventDatasource.createEvent(event);
  }

  readEvent() {
    // final firebaseService = Get.find<FirebaseService>();
    // firebaseService.noticeEventDatasource.readEvent();
  }
}
