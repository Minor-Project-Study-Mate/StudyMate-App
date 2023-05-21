import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:study_mate/app/services/auth/auth_service.dart';
import 'package:study_mate/app/services/sheet/sheet_service.dart';

import 'app/services/box/box_service.dart';
import 'firebase_options.dart';

/// The init() function is responsible for initializing various services and dependencies required by the application.
/// It initializes Firebase with the default options for the current platform (Android or Web).
/// It initializes the GetStorage package for storing and retrieving data.
/// It initializes the BoxService instance for managing storage.
/// It registers an instance of the AuthService class with the GetX dependency injection system.
/// This function is typically called at the beginning of the application to ensure that all required services and dependencies are initialized before the application starts running.
Future<void> init() async {
  // This code block is checking if the current platform is either Android or Web, and if so, it
  // initializes Firebase with the default options for that platform. This is necessary because
  // Firebase has different initialization options for different platforms, and this code ensures that
  // the correct options are used for the current platform.
  if (GetPlatform.isAndroid || GetPlatform.isWeb) {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }

  // if (GetPlatform.isAndroid) {
  //   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //       statusBarColor: Colors.transparent,
  //       systemNavigationBarColor: Colors.transparent));
  // }

  // `await GetStorage.init();` initializes the GetStorage package, which is a lightweight storage
  // library for Flutter and Dart that provides an easy-to-use key-value store. This line of code
  // initializes the storage system so that it can be used to store and retrieve data throughout the
  // application.
  await GetStorage.init();

  // `await Get.put<BoxService>(BoxService()).init();` is initializing the `BoxService` instance and
  // registering it with the GetX dependency injection system. It then calls the `init()` method on the
  // `BoxService` instance to initialize the storage system used by the application. This allows the
  // application to use the `BoxService` instance to store and retrieve data throughout the
  // application.
  await Get.put<BoxService>(BoxService()).init();

  Get.put<SheetService>(SheetService());

  // `Get.put(AuthService())` is registering an instance of the `AuthService` class with the GetX
  // dependency injection system. This allows the application to access the `AuthService` instance
  // throughout the application by calling `Get.find<AuthService>()`.
  Get.put(AuthService());
}
