import 'package:get/get.dart';

import '../controllers/about_page_controller.dart';

class AboutPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutPageController>(
      () => AboutPageController(),
    );
  }
}
