import 'package:get/get.dart';
import 'package:study_mate/app/services/auth/auth_service.dart';
import 'package:study_mate/app/services/firebase/firebase_service.dart';

import '../../../services/firebase/model/app_user_model.dart';

class MyBatchController extends GetxController {
  AuthService get authService => Get.find<AuthService>();

  Future<List<AppUser>> getAppUserList() async =>
      await Get.find<FirebaseService>().userDatasources.getUserList();

  bool isMe(String email) => authService.user.value?.email == email;
}
