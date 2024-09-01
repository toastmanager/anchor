// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      fullName: json['fullName'] as String,
      avatarUrl: json['avatar_url'] as String?,
      birthDate:
          DateSerialization.fromJson((json['birth_date'] as num).toInt()),
      balance: (json['balance'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'avatar_url': instance.avatarUrl,
      'birth_date': DateSerialization.toJson(instance.birthDate),
      'balance': instance.balance,
    };
