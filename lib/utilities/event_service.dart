import 'dart:developer';
import 'dart:io';
import 'package:anchor/entities/my_event_entity.dart';
import 'package:anchor/models/my_event_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class EventService {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
  final _storageRef = FirebaseStorage.instance.ref();

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

  Stream<QuerySnapshot> getCurrentUserCompletedEvents() {
    try {
      return _eventsRef
        .where('participants', arrayContains: _auth.currentUser?.uid)
        .where('beginTime', isLessThan: DateTime.now())
        .snapshots();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Stream<QuerySnapshot> getCurrentUserChoosedEvents() {
    try {
      return _eventsRef
        .where('participants', arrayContains: _auth.currentUser?.uid)
        .where('beginTime', isGreaterThan: DateTime.now())
        .snapshots();
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

  Future<void> createEvent(MyEvent event, XFile image) async {
    String? eventId;
    bool isFilePutted = false;
    bool eventCreated = false;
    final fileName = image.path.split("/").last;
    try {
      eventId = _db.collection('events').doc().id;
      
      final uploadRef = _storageRef.child("events/uploads/$eventId/$fileName");
      await uploadRef.putFile(File(image.path));
      isFilePutted = true;
      
      event = event.copyWith(
        uid: eventId,
        image: await uploadRef.getDownloadURL()
      );
      await _db
        .collection('events')
        .doc(eventId)
        .set(MyEvent.toEntity(event).toDocumentWithoutUid());
      eventCreated = true;
    } catch (e) {
      if (eventId != null) {
        if (eventCreated) {
          _db.collection('events').doc(eventId).delete();
        }
        if (isFilePutted) {
          _storageRef.child("events/uploads/$eventId/$fileName").delete();
        }
      }
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