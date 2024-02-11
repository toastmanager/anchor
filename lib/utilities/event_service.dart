import 'dart:developer';
import 'package:anchor/entities/my_event_entity.dart';
import 'package:anchor/models/my_event_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventService {
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

  Stream<QuerySnapshot> getEvents() {
    try {
      return _eventsRef.snapshots();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}