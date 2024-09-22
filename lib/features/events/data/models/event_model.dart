import 'package:anchor/core/utils/date_serialization.dart';
import 'package:anchor/core/utils/hex_utils.dart';
import 'package:anchor/features/events/domain/entities/event_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'event_model.g.dart';

@JsonSerializable()
class EventModel extends Equatable {
  final int id;
  @JsonKey(
      name: 'created_at',
      toJson: DateSerialization.toJson,
      fromJson: DateSerialization.fromJson)
  final DateTime createdAt;
  final String name;
  final String description;
  @JsonKey(
      name: 'start_date',
      toJson: DateSerialization.tryToJson,
      fromJson: DateSerialization.tryFromJson)
  final DateTime? startDate;
  @JsonKey(fromJson: HexUtils.tryParse)
  final int? color;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  final int reward;
  final String? author;
  @JsonKey(name: 'is_participant', includeFromJson: true, includeToJson: false)
  final bool isParticipant;

  const EventModel(
      {required this.id,
      required this.createdAt,
      required this.name,
      required this.description,
      required this.reward,
      this.isParticipant = false,
      this.startDate,
      this.color,
      this.imageUrl,
      this.author});

  EventModel copyWith(
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
    return EventModel(
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
  List<Object?> get props => [
        id,
        createdAt,
        name,
        description,
        startDate,
        color,
        imageUrl,
        reward,
        author,
        isParticipant
      ];

  @override
  String toString() {
    return 'EventModel{id=$id, createdAt=$createdAt, name=$name, description=$description, startDate=$startDate, color=$color, imageUrl=$imageUrl, reward=$reward, author=$author, isParticipant=$isParticipant}';
  }

  Map<String, dynamic> toJson() => _$EventModelToJson(this);

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  EventEntity toEntity() => EventEntity(
      id: id,
      createdAt: createdAt,
      name: name,
      description: description,
      startDate: startDate,
      color: color,
      imageUrl: imageUrl,
      reward: reward,
      author: author,
      isParticipant: isParticipant);

  factory EventModel.fromEntity(EventEntity entity) => EventModel(
      id: entity.id,
      createdAt: entity.createdAt,
      name: entity.name,
      description: entity.description,
      startDate: entity.startDate,
      color: entity.color,
      imageUrl: entity.imageUrl,
      reward: entity.reward,
      author: entity.author,
      isParticipant: entity.isParticipant);
}
