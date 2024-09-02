// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) => SignUpModel(
      email: json['email'] as String?,
      password: json['password'] as String,
      userModel: UserSignUpModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpModelToJson(SignUpModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'data': instance.userModel.toJson(),
    };
