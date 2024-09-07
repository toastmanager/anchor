import 'package:flutter/material.dart';
import 'package:anchor/core/utils/date_serialization.dart';
import 'package:anchor/features/personal_profile/domain/entities/personal_profile_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'personal_profile_model.g.dart';

@JsonSerializable()
class PersonalProfileModel extends Equatable {
  final String id;
  @JsonKey(name: 'full_name')
  final String fullName;
  final String email;
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @JsonKey(
      name: 'birth_date',
      fromJson: DateSerialization.fromJson,
      toJson: DateSerialization.toJson)
  final DateTime birthDate;

  const PersonalProfileModel(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.birthDate,
      this.avatarUrl});

  @override
  List<Object?> get props => [id, fullName, email, avatarUrl, birthDate];

  @override
  String toString() {
    return 'PersonalProfileModel{id=$id, fullName=$fullName, email=$email, avatarUrl=$avatarUrl, birthDate=$birthDate}';
  }

  PersonalProfileModel copyWith(
      {String? id,
      String? fullName,
      String? email,
      ValueGetter<String?>? avatarUrl,
      DateTime? birthDate}) {
    return PersonalProfileModel(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        avatarUrl: avatarUrl != null ? avatarUrl() : this.avatarUrl,
        birthDate: birthDate ?? this.birthDate);
  }

  Map<String, dynamic> toJson() => _$PersonalProfileModelToJson(this);

  factory PersonalProfileModel.fromJson(Map<String, dynamic> json) =>
      _$PersonalProfileModelFromJson(json);

  PersonalProfileEntity toEntity() {
    return PersonalProfileEntity(
        id: id,
        fullName: fullName,
        email: email,
        birthDate: birthDate,
        avatarUrl: avatarUrl);
  }

  factory PersonalProfileModel.fromEntity(PersonalProfileEntity entity) {
    return PersonalProfileModel(
        id: entity.id,
        fullName: entity.fullName,
        email: entity.email,
        birthDate: entity.birthDate,
        avatarUrl: entity.avatarUrl);
  }
}
