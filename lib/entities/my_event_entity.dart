import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MyEventEntity extends Equatable {
  final String uid;
  final String title;
  final Timestamp beginTime;
  final int cost;
  final String description;
  final String image;
  final List<String> participants;

  const MyEventEntity({
    required this.uid,
    required this.title,
    required this.beginTime,
    required this.cost,
    required this.image,
    required this.description,
    required this.participants,
  });

  Map<String, Object?> toDocument() {
    return {
      "uid": uid,
      "title": title,
      "beginTime": beginTime,
      "cost": cost,
      "image": image,
      "description": description,
      "participants": participants,
    };
  }

  MyEventEntity fromDocument(Map<String, Object?> doc) {
    return MyEventEntity(
      uid: uid,
      title: title,
      beginTime: beginTime,
      cost: cost,
      image: image,
      description: description,
      participants: participants,
    );
  }

  @override
  List<Object?> get props => [uid, title, beginTime, cost, image, description, participants];
}