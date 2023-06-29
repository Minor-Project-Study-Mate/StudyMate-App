import 'package:get/get.dart';

import '../modules/about_page/bindings/about_page_binding.dart';
import '../modules/about_page/views/about_page_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/course/bindings/course_binding.dart';
import '../modules/course/views/course_view.dart';
import '../modules/create_notice/bindings/create_notice_binding.dart';
import '../modules/create_notice/views/create_notice_view.dart';
import '../modules/event_page/bindings/event_page_binding.dart';
import '../modules/event_page/views/event_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/intro/bindings/intro_binding.dart';
import '../modules/intro/views/intro_view.dart';
import '../modules/my_batch/bindings/my_batch_binding.dart';
import '../modules/my_batch/views/my_batch_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/test_page/bindings/test_page_binding.dart';
import '../modules/test_page/views/test_page_view.dart';
import '../modules/video_lecture/bindings/video_lecture_binding.dart';
import '../modules/video_lecture/views/video_lecture_view.dart';
import '../services/auth/auth_service.dart';

// ignore_for_file: non_constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  /// This line of code is setting the initial route of the application based on whether the user is
  /// already logged in or not. It is checking if the `appUser` property of the `BoxService` instance is
  /// null or not. If it is null, then the initial route is set to `Routes.INTRO`, which is the route for
  /// the introduction screen. If it is not null, then the initial route is set to `Routes.HOME`, which is
  /// the route for the home screen.
  static final INITIAL =
      Get.find<AuthService>().user.value == null ? Routes.INTRO : Routes.HOME;

  // static const INITIAL = Routes.INTRO;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INTRO,
      page: () => const IntroView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.TEST_PAGE,
      page: () => const TestPageView(),
      binding: TestPageBinding(),
    ),
    GetPage(
      name: _Paths.NOTICE_PAGE,
      page: () => const EventPageView(),
      binding: EventPageBinding(),
    ),
    GetPage(
      name: _Paths.MY_BATCH,
      page: () => const MyBatchView(),
      binding: MyBatchBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_NOTICE,
      page: () => const CreateNoticeView(),
      binding: CreateNoticeBinding(),
    ),
    GetPage(
      name: _Paths.COURSE,
      page: () => const CourseView(),
      binding: CourseBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO_LECTURE,
      page: () => const VideoLectureView(),
      binding: VideoLectureBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_PAGE,
      page: () => const AboutPageView(),
      binding: AboutPageBinding(),
    ),
  ];
}
