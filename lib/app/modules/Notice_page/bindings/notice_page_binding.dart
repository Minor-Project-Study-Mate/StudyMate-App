import 'package:get/get.dart';

import '../controllers/notice_page_controller.dart';

class NoticePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoticePageController>(
      () => NoticePageController(),
    );
  }
}
