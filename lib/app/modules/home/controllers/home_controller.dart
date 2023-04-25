import 'package:get/get.dart';

import '../../../services/box/box_service.dart';

class HomeController extends GetxController {
  final boxService = Get.find<BoxService>();

  String get getFirstName {
    final name = boxService.appUserBox.appUser?.displayName ?? "";
    return name.split(" ")[0];
  }
}
