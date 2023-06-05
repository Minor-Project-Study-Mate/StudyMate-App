import 'package:get/get.dart';

import '../controllers/video_lecture_controller.dart';

class VideoLectureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoLectureController>(
      () => VideoLectureController(),
    );
  }
}
