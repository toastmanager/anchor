// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sign_up_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSignUpModel _$UserSignUpModelFromJson(Map<String, dynamic> json) =>
    UserSignUpModel(
      fullName: json['full_name'] as String,
      birthDate: DateSerialization.fromJson(json['birth_date'] as String),
    );

Map<String, dynamic> _$UserSignUpModelToJson(UserSignUpModel instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'birth_date': DateSerialization.toJson(instance.birthDate),
    };
