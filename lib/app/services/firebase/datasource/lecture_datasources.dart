import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_mate/app/services/firebase/model/cource_model.dart';
import 'package:study_mate/app/services/firebase/model/lecture_model.dart';

class LectureDatasources {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Subject>> getLectures() async {
    final lectures = await _firestore.collection('lectures').get();
    return lectures.docs.map((e) => Subject.fromMap(e.data())).toList();
  }

  Future<void> addLecture(Cource cource) async {
    await _firestore.collection('lectures').add(cource.toMap());
  }
}
