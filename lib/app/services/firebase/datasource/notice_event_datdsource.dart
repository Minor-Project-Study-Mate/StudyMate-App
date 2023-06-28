import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/notice_modal.dart';

class NoticeEventDatasource {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  // Create Event
  Future<DocumentReference<Map<String, dynamic>>> createEvent(
    Event event,
  ) async =>
      await _firebase.collection('notice').add(
            event.toMap(),
          );

  // Get Event
  Future<List<Event>> getEventList() async {
    final snapshot = await _firebase.collection('notice').get();

    if (snapshot.docs.isEmpty) return [];
    final List<Event> events =
        snapshot.docs.map((e) => Event.fromMap(e.data())).toList();
    return events;
  }

  // Update Event
  Future<void> updateEvent(String eventId, Event updatedEvent) async =>
      await _firebase
          .collection('notice')
          .doc(eventId)
          .update(updatedEvent.toMap());

  // Delete Event
  Future<void> deleteEvent(String eventId) async =>
      await _firebase.collection('notice').doc(eventId).delete();
}
