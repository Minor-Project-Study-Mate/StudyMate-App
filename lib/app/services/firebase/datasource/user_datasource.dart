import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../model/app_user_model.dart';

class UserDatasources {
  final FirebaseFirestore firebase;
  UserDatasources(this.firebase);

  createUser(AppUser user) {
    // email -> signup
    // google -> if dosent exesis in firebase create user
  }

  AppUser? updateUser(AppUser user) {
    // branch
  }

  List<AppUser> getUserList() {
    return [];
  }

  AppUser? getUser() {}
}
