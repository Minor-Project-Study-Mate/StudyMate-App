import 'package:get/get.dart';
import 'package:study_mate/app/routes/app_pages.dart';
import 'package:study_mate/app/services/auth/auth_service.dart';

class AuthController extends GetxController {
  final auth = Get.find<AuthService>();

  Future<void> googleSignIn() async {
    final res = await auth.googleSignIn();
    if (res != null) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.snackbar("Error", "Please try again");
    }
  }

  void fakeSignIn() async {
    await auth.fakeLogin();
    Get.offAllNamed(Routes.HOME);
  }
}
