import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

class EventEntity extends Equatable {
  final int id;
  final DateTime createdAt;
  final String name;
  final String description;
  final DateTime? startDate;
  final int? color;
  final String? imageUrl;
  final int reward;
  final String? author;

  const EventEntity(
      {required this.id,
      required this.createdAt,
      required this.name,
      required this.description,
      required this.startDate,
      required this.color,
      required this.reward,
      required this.author,
      this.imageUrl});

  @override
  List<Object?> get props => [
        id,
        createdAt,
        name,
        description,
        startDate,
        color,
        imageUrl,
        reward,
        author
      ];

  EventEntity copyWith(
      {int? id,
      DateTime? createdAt,
      String? name,
      String? description,
      DateTime? startDate,
      int? color,
      ValueGetter<String?>? imageUrl,
      int? reward,
      String? author}) {
    return EventEntity(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        color: color ?? this.color,
        imageUrl: imageUrl != null ? imageUrl() : this.imageUrl,
        reward: reward ?? this.reward,
        author: author ?? this.author);
  }

  @override
  String toString() {
    return 'EventEntity{id=$id, createdAt=$createdAt, name=$name, description=$description, startDate=$startDate, color=$color, imageUrl=$imageUrl, reward=$reward, author=$author}';
  }
}
