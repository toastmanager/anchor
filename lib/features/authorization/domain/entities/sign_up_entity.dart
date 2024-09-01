import 'package:equatable/equatable.dart';

class SignUpEntity extends Equatable {
  final String email;
  final String password;
  final String fullName;
  final DateTime birthDate;

  const SignUpEntity(
      {required this.email,
      required this.password,
      required this.fullName,
      required this.birthDate});

  @override
  List<Object?> get props => [email, password, fullName, birthDate];

  SignUpEntity copyWith(
      {String? email, String? password, String? fullName, DateTime? birthday}) {
    return SignUpEntity(
        email: email ?? this.email,
        password: password ?? this.password,
        fullName: fullName ?? this.fullName,
        birthDate: birthday ?? this.birthDate);
  }
}
