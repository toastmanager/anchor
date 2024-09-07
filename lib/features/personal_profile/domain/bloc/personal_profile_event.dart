part of 'personal_profile_bloc.dart';

sealed class PersonalProfileEvent extends Equatable {
  const PersonalProfileEvent();

  @override
  List<Object> get props => [];
}

class PersonalProfileGet extends PersonalProfileEvent {}

class PersonalProfileUpdate extends PersonalProfileEvent {}

class PersonalProfileLogOut extends PersonalProfileEvent {}

class PersonalProfileFullNameChange extends PersonalProfileEvent {}

class PersonalProfileEmailChange extends PersonalProfileEvent {}

class PersonalProfileBirthDateChange extends PersonalProfileEvent {}