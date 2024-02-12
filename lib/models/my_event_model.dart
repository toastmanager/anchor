import 'package:anchor/entities/my_event_entity.dart';
import 'package:anchor/utilities/event_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MyEvent extends Equatable {
  final String uid;
  final String organizer;
  final String title;
  final Timestamp beginTime;
  final int cost;
  final String description;
  final String image;
  final List<dynamic> participants;

  const MyEvent({
    required this.uid,
    required this.organizer,
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
    organizer: '',
    beginTime: Timestamp(0, 0),
    cost: 0,
    image: '',
    description: 'description',
    participants: const [],
  );

  bool get isEmpty => this == MyEvent.empty;
  bool get isNotEmpty => this != MyEvent.empty;
  Future<bool> get isUserParticipate async => await EventService().isUserParticipate(uid);

  static MyEventEntity toEntity(MyEvent event) {
    return MyEventEntity(
      uid: event.uid,
      title: event.title,
      beginTime: event.beginTime,
      organizer: event.organizer,
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
      organizer: entity.organizer,
      beginTime: entity.beginTime,
      cost: entity.cost,
      image: entity.image,
      description: entity.description,
      participants: entity.participants,
    );
  }

  MyEvent copyWith({
      String? uid,
      String? title,
      String? organizer,
      Timestamp? beginTime,
      int? cost,
      String? description,
      String? image,
      List<dynamic>? participants,
  }) {
    return MyEvent(
      uid: uid ?? this.uid,
      title: title ?? this.title,
      organizer: organizer ?? this.organizer,
      beginTime: beginTime ?? this.beginTime,
      cost: cost ?? this.cost,
      image: image ?? this.image,
      description: description ?? this.description,
      participants: participants ?? this.participants,
    );
  }

  @override
  List<Object?> get props => [uid, title, beginTime, cost, image, description, participants];
}
