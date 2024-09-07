import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class PersonalProfileEntity extends Equatable {
  final String id;
  final String fullName;
  final String email;
  final String? avatarUrl;
  final DateTime birthDate;

  const PersonalProfileEntity(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.birthDate,
      this.avatarUrl});

  @override
  List<Object?> get props => [id, fullName, email, avatarUrl, birthDate];

  PersonalProfileEntity copyWith(
      {String? id,
      String? fullName,
      String? email,
      ValueGetter<String?>? avatarUrl,
      DateTime? birthDate}) {
    return PersonalProfileEntity(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        avatarUrl: avatarUrl != null ? avatarUrl() : this.avatarUrl,
        birthDate: birthDate ?? this.birthDate);
  }

  @override
  String toString() {
    return 'PersonalProfileEntity{id=$id, fullName=$fullName, email=$email, avatarUrl=$avatarUrl, birthDate=$birthDate}';
  }
}
