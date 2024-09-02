import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class UserSignUpEntity extends Equatable {
  final String fullName;
  final DateTime birthDate;

  const UserSignUpEntity({required this.fullName, required this.birthDate});

  @override
  List<Object?> get props => [fullName, birthDate];

  UserSignUpEntity copyWith(
      {String? fullName,
      ValueGetter<DateTime?>? createdAt,
      ValueGetter<String?>? email,
      ValueGetter<String?>? avatarUrl,
      DateTime? birthDate,
      ValueGetter<int?>? balance}) {
    return UserSignUpEntity(
      fullName: fullName ?? this.fullName,
      birthDate: birthDate ?? this.birthDate,
    );
  }
}
