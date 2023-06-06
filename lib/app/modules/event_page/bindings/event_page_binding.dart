import 'package:get/get.dart';

import '../controllers/event_page_controller.dart';

class EventPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventPageController>(
      () => EventPageController(),
    );
  }
}
