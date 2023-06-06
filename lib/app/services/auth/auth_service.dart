import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../box/box_service.dart';

class AuthService extends GetxService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final Rx<User?> user = Rx<User?>(null);
  BoxService get box => Get.find<BoxService>();

  String? get displayName => user.value?.displayName;
  String? get email => user.value?.email;
  String? get photoURL => user.value?.photoURL;

  @override
  void onInit() {
    user.value = auth.currentUser;
    super.onInit();
  }

  Future<void> fakeLogin() async {
    // await box.appUserBox.saveAppUser(AppUser(
    //   displayName: "User Name",
    //   photoURL: 'https://avatars.githubusercontent.com/u/87150492?v=4',
    //   email: "example@email.com",
    // ));
  }

  Future<void> emailPasswdSignUp(String email, String password) async {
    try {
      final res = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user.value = res.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', "Wrong password provided for that user.");
      }
    }
  }

  Future<User?> createUser(
      String userName, String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        await userCredential.user!.updateDisplayName(userName);
        user.value = userCredential.user;
        return user.value;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Error', 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'The account already exists for that email.');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
      return null;
    }
    return null;
  }

  Future<User?> googleSignIn() async {
    try {
      print(1);
      final account = kIsWeb
          ? await _googleSignIn.signInSilently()
          : await _googleSignIn.signIn();
      print(2);
      if (account == null) return null;
      print(3);
      final authentication = await account.authentication;
      print(4);
      final credential = GoogleAuthProvider.credential(
          accessToken: authentication.accessToken,
          idToken: authentication.idToken);
      print(5);
      await auth.signInWithCredential(credential).then((value) => 
      print(value)).onError((error, stackTrace) {
        print("Error");
        print(error);});
        print("########################");
      print(6);
      user.value = auth.currentUser;
      return user.value;
    } catch (error) {
      // Get.snackbar('Error', error.toString());
      // return null;
      rethrow;
    }
  }

  bool isAuthenticated() => user.value != null;

  String googleUserInfo() => _googleSignIn.currentUser?.displayName ?? '';

  Future<void> logout() async {
    try {
      // await box.appUserBox.deleteAppUser();
      await _googleSignIn.signOut();
    } catch (error) {
      Get.snackbar('Error', error.toString());
    }
  }

  @override
  void onClose() {
    _googleSignIn.disconnect();
    super.onClose();
  }
}
