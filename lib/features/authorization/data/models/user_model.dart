import 'package:anchor/features/authorization/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:anchor/core/utils/date_serialization.dart';
import 'package:equatable/equatable.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  final String fullName;
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @JsonKey(
    name: 'birth_date',
    fromJson: DateSerialization.fromJson,
    toJson: DateSerialization.toJson,
  )
  final DateTime birthDate;
  final int? balance;

  const UserModel(
      {required this.fullName,
      required this.avatarUrl,
      required this.birthDate,
      required this.balance});

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
        fullName: entity.fullName,
        avatarUrl: entity.avatarUrl,
        birthDate: entity.birthDate,
        balance: entity.balance);
  }

  UserEntity toEntity() {
    return UserEntity(
        fullName: fullName,
        avatarUrl: avatarUrl,
        birthDate: birthDate,
        balance: balance);
  }

  @override
  List<Object?> get props => throw UnimplementedError();

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
