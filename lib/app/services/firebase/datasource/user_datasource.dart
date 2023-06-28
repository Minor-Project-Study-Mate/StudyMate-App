import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/app_user_model.dart';

class UserDatasources {
  final FirebaseFirestore firebase = FirebaseFirestore.instance;

  Future<void> createUser(AppUser user) async {
    await firebase.collection('users').add(user.toMap());
  }

  Future<List<AppUser>> getUserList() async {
    final res = await firebase.collection('users').get();
    if (res.docs.isEmpty) return [];
    return res.docs.map((e) => AppUser.fromMap(e.data())).toList();
  }

  Future<bool> usreExist(AppUser user) async {
    final res = await firebase
        .collection('users')
        .limit(1)
        .where('email', isEqualTo: user.email)
        .get();
    return (res.docs.isEmpty) ? false : true;
  }

  Future<AppUser?> getMe(String email) async {
    final res = await firebase
        .collection('users')
        .limit(1)
        .where('email', isEqualTo: email)
        .get();
    if (res.docs.isEmpty) return null;
    return AppUser.fromMap(res.docs.first.data());
  }
}
