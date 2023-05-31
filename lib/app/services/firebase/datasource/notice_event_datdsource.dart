import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/notice_modal.dart';

class NoticeEventDatasource {
  final FirebaseFirestore firebase;
  NoticeEventDatasource(this.firebase);

  Future<void> createEvent(Event event) async {
    await firebase.collection('notice').add(event.toMap());
  }

  Future<List<Event>> readEvent() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await firebase.collection('notice').get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>> res = snapshot.docs;

    print(res[0].data().runtimeType);

    for (int i = 0; i < res.length; i++) {

      final Map<String, dynamic> data = res[i].data();

      final Event event = Event.fromMap(data);

      print(event.title);
      print(event.description);
    }

    return [];
  }

  updateEvent() {}

  deleteEvent() {}
}
