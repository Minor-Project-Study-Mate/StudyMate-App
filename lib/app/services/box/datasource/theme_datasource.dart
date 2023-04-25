import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:study_mate/app/services/box/usecase/theme_usecase.dart';

class ThemeDatasource implements ThemeUsecase {
  final GetStorage box;
  ThemeDatasource(this.box);

  @override
  Future<void> changeThemeMode(ThemeMode themeMode) async =>
      await saveTheme(themeMode)
          .then((value) => Get.changeThemeMode(themeMode));

  @override
  ThemeMode get getTheme {
    final res = box.read<int>("themeMode");
    return res == null ? ThemeMode.system : ThemeMode.values[res];
  }

  @override
  Future<void> saveTheme(ThemeMode themeMode) async =>
      await box.write("themeMode", themeMode.index);
}
