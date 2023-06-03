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

    if (res.isNotEmpty) {
      final List<Event> events =
          res.map((e) => Event.fromMap(e.data())).toList();
      return events;
    }
    return [];
  }

  Future<void> updateEvent(String eventId, Event updatedEvent) async {
    await firebase.collection('notice').doc(eventId).update(updatedEvent.toMap());
  }

  Future<void> deleteEvent(String eventId) async {
    await firebase.collection('notice').doc(eventId).delete();
}
}