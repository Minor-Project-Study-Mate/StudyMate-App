import 'package:get/get.dart';
import 'package:study_mate/app/modules/home/controllers/resources_controller.dart';
import 'package:study_mate/app/services/auth/auth_service.dart';
import 'package:study_mate/app/services/firebase/model/notice_modal.dart';

import '../../../services/box/box_service.dart';
import '../../../services/firebase/firebase_service.dart';
import 'fav_controller.dart';

class HomeController extends GetxController {
  late final FavController favController;

  final authService = Get.find<AuthService>();
  final resController = ResourcesController();
  final boxService = Get.find<BoxService>();

  @override
  void onInit() {
    resController.init();
    favController = FavController(this);
    super.onInit();
  }

  void rerender() => update();

  String get getFirstName {
    final name = authService.displayName ?? "";
    return name.split(" ")[0];
  }

  Future<List<Event>> getEventList() async {
    final firebaseService = Get.find<FirebaseService>();
    try {
      return await firebaseService.noticeEventDatasource.getEventList();
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return [];
    }
  }
}
