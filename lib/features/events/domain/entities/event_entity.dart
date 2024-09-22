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
  final bool isParticipant;

  const EventEntity(
      {required this.id,
      required this.createdAt,
      required this.name,
      required this.description,
      required this.startDate,
      required this.color,
      required this.reward,
      required this.author,
      this.isParticipant = false,
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
      String? imageUrl,
      int? reward,
      String? author,
      bool? isParticipant}) {
    return EventEntity(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        color: color ?? this.color,
        imageUrl: imageUrl ?? this.imageUrl,
        reward: reward ?? this.reward,
        author: author ?? this.author,
        isParticipant: isParticipant ?? this.isParticipant);
  }

  @override
  String toString() {
    return 'EventEntity{id=$id, createdAt=$createdAt, name=$name, description=$description, startDate=$startDate, color=$color, imageUrl=$imageUrl, reward=$reward, author=$author}';
  }
}
