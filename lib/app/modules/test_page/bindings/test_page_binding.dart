import 'package:get/get.dart';

import '../controllers/test_page_controller.dart';

class TestPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestPageController>(
      () => TestPageController(),
    );
  }
}
