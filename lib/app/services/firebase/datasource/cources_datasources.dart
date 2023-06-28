import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_mate/app/services/firebase/model/cource_model.dart';

class CourcesDatasources {
  final firebase = FirebaseFirestore.instance;

  Future<List<Cource>> getCources() async {
    final res = await firebase.collection('cources').get();
    if (res.docs.isEmpty) return [];
    return res.docs.map((e) => Cource.fromMap(e.data())).toList();
  }

  Future<void> addCource(Cource cource) async {
    await firebase.collection('cources').add(cource.toMap());
  }
}
