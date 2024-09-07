import 'package:equatable/equatable.dart';

class PersonalProfileEntity extends Equatable {
  final String id;
  final String fullName;
  final String email;
  final DateTime birthDate;

  const PersonalProfileEntity(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.birthDate});

  @override
  List<Object?> get props => [id, fullName, email, birthDate];

  PersonalProfileEntity copyWith(
      {String? id, String? fullName, String? email, DateTime? birthDate}) {
    return PersonalProfileEntity(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        birthDate: birthDate ?? this.birthDate);
  }

  @override
  String toString() {
    return 'PersonalProfileEntity{id=$id, fullName=$fullName, email=$email, birthDate=$birthDate}';
  }
}
