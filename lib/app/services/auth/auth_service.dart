import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:study_mate/app/services/box/models/app_user.dart';

import '../box/box_service.dart';

class AuthServices extends GetxService {
  late final GoogleSignIn _googleSignIn;
  final googleSignInAccount = Rx<GoogleSignInAccount?>(null);

  static BoxService get box => Get.find<BoxService>();

  @override
  void onInit() {
    _googleSignIn = GoogleSignIn();
    googleSignInAccount.value = _googleSignIn.currentUser;
    super.onInit();
  }

  Future<GoogleSignInAccount?> googleSignIn() async {
    try {
      if (kIsWeb) {
        googleSignInAccount.value = await _googleSignIn.signInSilently();
        if (googleSignInAccount.value != null) {
          await box.appUser
              .saveAppUser(googleSignInAccount.value!.fromGoogleSignInAccount);
        }
      } else {
        googleSignInAccount.value = await _googleSignIn.signIn();
        if (googleSignInAccount.value != null) {
          await box.appUser
              .saveAppUser(googleSignInAccount.value!.fromGoogleSignInAccount);
        }
      }
      return googleSignInAccount.value;
    } catch (error) {
      Get.snackbar('Error', error.toString());
      rethrow;
    }
  }

  Future<bool> printIsSignIn() async => await _googleSignIn.isSignedIn();

  String googleUserInfo() => _googleSignIn.currentUser?.displayName ?? '';

  Future<void> logout() async {
    try {
      await _googleSignIn.signOut();
      await box.appUser.deleteAppUser();
    } catch (error) {
      print(error);
    }
  }

  @override
  void onClose() {
    _googleSignIn.disconnect();
    super.onClose();
  }
}
