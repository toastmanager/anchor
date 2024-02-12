import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MyEventEntity extends Equatable {
  final String uid;
  final String title;
  final String organizer;
  final Timestamp beginTime;
  final int cost;
  final String description;
  final String image;
  final List<dynamic> participants;

  const MyEventEntity({
    required this.uid,
    required this.title,
    required this.beginTime,
    required this.organizer,
    required this.cost,
    required this.image,
    required this.description,
    required this.participants,
  });

  Map<String, Object?> toDocument() {
    return {
      "uid": uid,
      "title": title,
      "organizer": organizer,
      "beginTime": beginTime,
      "cost": cost,
      "image": image,
      "description": description,
      "participants": participants,
    };
  }
  Map<String, Object?> toDocumentWithoutUid() {
    return {
      "title": title,
      "organizer": organizer,
      "beginTime": beginTime,
      "cost": cost,
      "image": image,
      "description": description,
      "participants": participants,
    };
  }

  static MyEventEntity fromDocument(Map<String, Object?> doc, String uid) {
    return MyEventEntity(
      uid: uid,
      organizer: doc["organizer"] as String,
      title: doc["title"] as String,
      beginTime: doc["beginTime"] as Timestamp,
      cost: doc["cost"] as int,
      image: doc["image"] as String,
      description: doc["description"] as String,
      participants: doc["participants"] as List<dynamic>,
    );
  }

  @override
  List<Object?> get props => [uid, title, beginTime, cost, image, description, participants];
}