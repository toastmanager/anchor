import 'package:anchor/entities/my_event_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MyEvent extends Equatable {
  final String uid;
  final String title;
  final Timestamp beginTime;
  final int cost;
  final String description;
  final String image;
  final List<dynamic> participants;

  const MyEvent({
    required this.uid,
    required this.title,
    required this.beginTime,
    required this.cost,
    required this.image,
    required this.description,
    required this.participants,
  });

  static MyEvent empty = MyEvent(
    uid: '',
    title: '',
    beginTime: Timestamp(0, 0),
    cost: 0,
    image: '',
    description: 'description',
    participants: const [],
  );

  bool get isEmpty => this == MyEvent.empty;
  bool get isNotEmpty => this != MyEvent.empty;

  static MyEventEntity toEntity(MyEvent event) {
    return MyEventEntity(
      uid: event.uid,
      title: event.title,
      beginTime: event.beginTime,
      cost: event.cost,
      image: event.image,
      description: event.description,
      participants: event.participants,
    );
  }

  static MyEvent fromEntity(MyEventEntity entity) {
    return MyEvent(
      uid: entity.uid,
      title: entity.title,
      beginTime: entity.beginTime,
      cost: entity.cost,
      image: entity.image,
      description: entity.description,
      participants: entity.participants,
    );
  }

  @override
  List<Object?> get props => [uid, title, beginTime, cost, image, description, participants];
}
