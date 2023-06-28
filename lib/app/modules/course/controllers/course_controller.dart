import 'package:get/get.dart';
import 'package:study_mate/app/services/firebase/firebase_service.dart';
import 'package:study_mate/app/services/firebase/model/cource_model.dart';

const dummyImagesUrls = [
  "https://picsum.photos/200/300",
  "https://picsum.photos/seed/picsum/200/300",
  "https://picsum.photos/id/237/200/300",
  "https://picsum.photos/200/300?grayscale",
  "https://picsum.photos/200/300/?blur",
];

class CourseController extends GetxController {
  FirebaseService get firebaseService => Get.find<FirebaseService>();

  Future<List<Cource>> getCources() async =>
      firebaseService.courceDatasource.getCources();

  Future<List<Cource>> getDummyCource() async {
    await Future.delayed(const Duration(milliseconds: 100));

    return [
      Cource(
          title: "UI/UX",
          url: "https://pub.dev/",
          thumbnailUrl: dummyImagesUrls[0]),
      Cource(
          title: "Coding",
          url: "https://pub.dev/",
          thumbnailUrl: dummyImagesUrls[1]),
      Cource(
          title: "App Design",
          url: "https://pub.dev/",
          thumbnailUrl: dummyImagesUrls[2]),
      Cource(
          title: "Basics",
          url: "https://pub.dev/",
          thumbnailUrl: dummyImagesUrls[3]),
      Cource(
          title: "Basics",
          url: "https://pub.dev/",
          thumbnailUrl: dummyImagesUrls[4]),
    ];
  }
}
