import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';

@freezed
class SignInEntity with _$SignInEntity {
  const factory SignInEntity({
    required String email,
    required String password,
  }) = _SignInEntity;
}

@freezed
class SignUpEntity with _$SignUpEntity {
  const factory SignUpEntity({
    required String email,
    required String password,
    required String fullName,
    required DateTime birthDate,
  }) = _SignUpEntity;
}