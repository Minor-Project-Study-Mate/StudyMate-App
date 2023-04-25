import 'package:flutter/material.dart' show ThemeMode;

abstract class ThemeUsecase {
  Future<void> saveTheme(ThemeMode themeMode);
  ThemeMode get getTheme;
  Future<void> changeThemeMode(ThemeMode themeMode);
}
