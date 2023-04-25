import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_mate/app/services/box/box_service.dart';
import 'package:study_mate/di.dart' as di;

import 'app/routes/app_pages.dart';

Future<void> main() async {
  // Ensure that all services are loaded before the application starts
  WidgetsFlutterBinding.ensureInitialized();
  // Initialization and Depedencies Injection
  await di.init();
  // Run Application
  runApp(const StudyMate());
}

class StudyMate extends StatelessWidget {
  const StudyMate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: "Application",
        initialRoute: AppPages.INITIAL,
        themeMode: Get.find<BoxService>().themeBox.getTheme,
        darkTheme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
        theme: ThemeData(brightness: Brightness.light, useMaterial3: true),
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
      );
}
