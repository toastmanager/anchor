import 'package:flutter/material.dart';
import 'package:anchor/features/authorization/domain/entities/user_sign_up_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:anchor/core/utils/date_serialization.dart';
import 'package:equatable/equatable.dart';

part 'user_sign_up_model.g.dart';

@JsonSerializable()
class UserSignUpModel extends Equatable {
  @JsonKey(
    name: 'full_name'
  )
  final String fullName;
  @JsonKey(
    name: 'birth_date',
    fromJson: DateSerialization.fromJson,
    toJson: DateSerialization.toJson,
  )
  final DateTime birthDate;

  const UserSignUpModel({
    required this.fullName,
    required this.birthDate,
  });

  factory UserSignUpModel.fromEntity(UserSignUpEntity entity) {
    return UserSignUpModel(
      fullName: entity.fullName,
      birthDate: entity.birthDate,
    );
  }

  UserSignUpEntity toEntity() {
    return UserSignUpEntity(fullName: fullName, birthDate: birthDate);
  }

  @override
  List<Object?> get props => [fullName, birthDate];

  Map<String, dynamic> toJson() => _$UserSignUpModelToJson(this);
  factory UserSignUpModel.fromJson(Map<String, dynamic> json) =>
      _$UserSignUpModelFromJson(json);

  UserSignUpModel copyWith(
      {String? fullName,
      ValueGetter<String?>? avatarUrl,
      DateTime? birthDate,
      ValueGetter<int?>? balance,
      ValueGetter<DateTime?>? createdAt,
      ValueGetter<String?>? email}) {
    return UserSignUpModel(
      fullName: fullName ?? this.fullName,
      birthDate: birthDate ?? this.birthDate,
    );
  }
}
