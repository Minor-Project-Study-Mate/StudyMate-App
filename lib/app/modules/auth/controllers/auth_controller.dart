import 'package:get/get.dart';
import 'package:study_mate/app/routes/app_pages.dart';
import 'package:study_mate/app/services/auth/auth_service.dart';

class AuthController extends GetxController {
  void emailPassword() {
    Get.offAllNamed(Routes.HOME);
  }

  Future<void> googleSignIn() async {
    final gAccount = await Get.find<AuthServices>().googleSignIn();
    if (gAccount != null) {
      if (gAccount.email.endsWith("kiit.ac.in")) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar("Error", "Please use your KIIT email id");
      }
    } else {
      Get.snackbar("Error", "Please try again");
    }
  }

  void facebookSignIn() {}

  void reset() {}

  final auth = Get.find<AuthServices>();
}
