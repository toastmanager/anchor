// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map<String, dynamic> json) => EventModel(
      id: (json['id'] as num).toInt(),
      createdAt: DateSerialization.fromJson(json['created_at'] as String),
      name: json['name'] as String,
      description: json['description'] as String,
      reward: (json['reward'] as num).toInt(),
      startDate: DateSerialization.tryFromJson(json['start_date'] as String?),
      color: (json['color'] as num?)?.toInt(),
      imageUrl: json['image_url'] as String?,
      author: json['author'] as String?,
    );

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': DateSerialization.toJson(instance.createdAt),
      'name': instance.name,
      'description': instance.description,
      'start_date': DateSerialization.tryToJson(instance.startDate),
      'color': instance.color,
      'image_url': instance.imageUrl,
      'reward': instance.reward,
      'author': instance.author,
    };
