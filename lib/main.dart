import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
//test
//test
void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        
        useMaterial3: true,
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        
        useMaterial3: true
      ),
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false
    ),
  );
}