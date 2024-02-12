import 'dart:developer';
import 'package:anchor/entities/my_event_entity.dart';
import 'package:anchor/models/my_event_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EventService {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  late final CollectionReference _eventsRef;

  EventService() {
    _eventsRef = _db
      .collection('events')
      .withConverter<MyEvent>(
        fromFirestore: (snapshot, _) => MyEvent.fromEntity(
          MyEventEntity.fromDocument(snapshot.data()!, snapshot.id)
        ),
        toFirestore: (event, _) => MyEvent
          .toEntity(event)
          .toDocument(),
      );
  }

  Stream<QuerySnapshot> getFutureEvents() {
    try {
      return _eventsRef.where('beginTime', isGreaterThan: DateTime.now()).snapshots();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Stream<QuerySnapshot> getEvents() {
    try {
      return _eventsRef.snapshots();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<bool> isUserParticipate(String eventUid) async {
    try {
      User? currentUser = _auth.currentUser;

      var eventSnapshot = await _eventsRef.doc(eventUid).get();
      MyEvent eventData = eventSnapshot.data() as MyEvent;

      return eventData.participants.contains(currentUser?.uid);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> createEvent(MyEvent event) async {
    try {
      await _db.collection('events').add(MyEvent.toEntity(event).toDocumentWithoutUid());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> eventSignUp(String eventUid) async {
    try {
      final eventDoc = _eventsRef.doc(eventUid);
      await eventDoc.update({
        'participants': FieldValue.arrayUnion([_auth.currentUser?.uid]),
      });
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> eventUnsign(String eventUid) async {
    try {
      final eventDoc = _eventsRef.doc(eventUid);
      await eventDoc.update({
        'participants': FieldValue.arrayRemove([_auth.currentUser?.uid]),
      });
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}