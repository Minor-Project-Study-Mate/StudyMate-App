
import 'package:get/get.dart';

import '../controllers/my_batch_controller.dart';

class MyBatchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyBatchController>(
      () => MyBatchController(),
    );
  }
}