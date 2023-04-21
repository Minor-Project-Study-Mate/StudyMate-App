import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:study_mate/app/services/box/box_service.dart';
import 'package:study_mate/di.dart' as di;

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.init();
  runApp(const StudyMate());
}

class StudyMate extends StatelessWidget {
  const StudyMate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: "Application",
        initialRoute: AppPages.INITIAL,
        themeMode: Get.find<BoxService>().theme.getTheme,
        darkTheme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
        theme: ThemeData(brightness: Brightness.light, useMaterial3: true),
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
      );
}
