import 'package:get/get.dart';
import 'package:study_mate/app/services/auth/auth_service.dart';

class HomeController extends GetxController {
  final authService = Get.find<AuthService>();

  String get getFirstName {
    final name = authService.displayName ?? "";
    return name.split(" ")[0];
  }
}
