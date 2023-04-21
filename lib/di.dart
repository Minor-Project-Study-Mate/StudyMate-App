import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:study_mate/app/services/auth/auth_service.dart';

import 'app/services/box/box_service.dart';

Future<void> init() async {
  await GetStorage.init();
  final cacheService = Get.put<BoxService>(BoxService());
  await cacheService.init();
  Get.put(AuthServices());
}
