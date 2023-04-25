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

  Future<void> fakeLogin() async {
    await box.appUserBox.saveAppUser(AppUser(
      displayName: "User Name",
      photoURL: 'https://avatars.githubusercontent.com/u/87150492?v=4',
      email: "example@email.com",
    ));
  }

  Future<GoogleSignInAccount?> googleSignIn() async {
    try {
      googleSignInAccount.value = kIsWeb
          ? await _googleSignIn.signInSilently()
          : await _googleSignIn.signIn();

      /// This code block is checking if the `googleSignInAccount` variable is not null. If it is not
      /// null, it saves the user's information to the app's local storage using the `saveAppUser`
      /// method from the `box.appUserBox` object. The `fromGoogleSignInAccount` property is used to
      /// convert the `GoogleSignInAccount` object to an `AppUser` object before saving it to the local
      /// storage.
      if (googleSignInAccount.value != null) {
        await box.appUserBox
            .saveAppUser(googleSignInAccount.value!.fromGoogleSignInAccount);
      }

      return googleSignInAccount.value;
    } catch (error) {
      Get.snackbar('Error', error.toString());
      return null;
    }
  }

  Future<bool> printIsSignIn() async => await _googleSignIn.isSignedIn();

  String googleUserInfo() => _googleSignIn.currentUser?.displayName ?? '';

  Future<void> logout() async {
    try {
      await box.appUserBox.deleteAppUser();
      await _googleSignIn.signOut();
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
