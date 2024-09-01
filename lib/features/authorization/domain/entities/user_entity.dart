import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String fullName;
  final String? avatarUrl;
  final DateTime birthDate;
  final int? balance;

  const UserEntity(
      {required this.fullName,
      required this.birthDate,
      this.avatarUrl,
      this.balance});

  @override
  List<Object?> get props => [fullName, avatarUrl, birthDate, balance];

  UserEntity copyWith(
      {String? fullName,
      ValueGetter<String?>? avatarUrl,
      DateTime? birthDate,
      ValueGetter<int?>? balance}) {
    return UserEntity(
        fullName: fullName ?? this.fullName,
        avatarUrl: avatarUrl != null ? avatarUrl() : this.avatarUrl,
        birthDate: birthDate ?? this.birthDate,
        balance: balance != null ? balance() : this.balance);
  }
}
