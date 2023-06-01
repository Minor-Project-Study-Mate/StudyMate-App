import 'package:get/get.dart';

import '../controllers/create_notice_controller.dart';

class CreateNoticeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateNoticeController>(
      () => CreateNoticeController(),
    );
  }
}
