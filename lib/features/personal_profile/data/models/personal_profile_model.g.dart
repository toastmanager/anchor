// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalProfileModel _$PersonalProfileModelFromJson(
        Map<String, dynamic> json) =>
    PersonalProfileModel(
      id: json['id'] as String,
      fullName: json['full_name'] as String,
      email: json['email'] as String,
      birthDate: DateSerialization.fromJson(json['birth_date'] as String),
      avatarUrl: json['avatar_url'] as String?,
    );

Map<String, dynamic> _$PersonalProfileModelToJson(
        PersonalProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'email': instance.email,
      'avatar_url': instance.avatarUrl,
      'birth_date': DateSerialization.toJson(instance.birthDate),
    };
