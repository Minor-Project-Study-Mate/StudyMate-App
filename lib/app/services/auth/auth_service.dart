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

  bool isAuthenticated() => user.value != null;

  @override
  void onInit() {
    user.value = auth.currentUser;
    super.onInit();
  }

  Future<User?> emailSignIn(String email, String password) async {
    try {
      final res = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user.value = res.user;
      return user.value;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', "Wrong password provided for that user.");
      }
    }
    return null;
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
      } else if (e.code == 'invalid-email') {
        Get.snackbar('Error', 'The email address is not valid.');
      } else if (e.code == 'operation-not-allowed') {
        Get.snackbar('Error', 'Email/password accounts are not enabled.');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
      return null;
    }
    return null;
  }

  Future<User?> googleSignIn() async {
    try {
      final account = kIsWeb
          ? await _googleSignIn.signInSilently()
          : await _googleSignIn.signIn();
      if (account == null) return null;
      final authentication = await account.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: authentication.accessToken,
          idToken: authentication.idToken);
      await auth.signInWithCredential(credential);
      user.value = auth.currentUser;
      return user.value;
    } catch (error) {
      Get.snackbar('Error', error.toString());
      rethrow;
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      Get.snackbar('Success', 'Check your email for reset link');
    } catch (error) {
      Get.snackbar('Error', error.toString());
    }
  }

  Future<void> logout() async {
    try {
      await _googleSignIn.signOut();
      await auth.signOut();
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
