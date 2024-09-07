part of 'personal_profile_bloc.dart';

sealed class PersonalProfileEvent extends Equatable {
  const PersonalProfileEvent();

  @override
  List<Object> get props => [];
}

class PersonalProfileGet extends PersonalProfileEvent {}

class PersonalProfileUpdate extends PersonalProfileEvent {}

class PersonalProfileLogOut extends PersonalProfileEvent {}

class PersonalProfileFullNameChange extends PersonalProfileEvent {
  final String fullName;

  const PersonalProfileFullNameChange({required this.fullName});
}

class PersonalProfileEmailChange extends PersonalProfileEvent {
  final String email;

  const PersonalProfileEmailChange({required this.email});
}

class PersonalProfileBirthDateChange extends PersonalProfileEvent {
  final DateTime birthDate;

  const PersonalProfileBirthDateChange({required this.birthDate});
}
