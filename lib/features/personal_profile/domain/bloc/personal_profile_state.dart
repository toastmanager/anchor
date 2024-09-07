part of 'personal_profile_bloc.dart';

sealed class PersonalProfileState extends Equatable {
  const PersonalProfileState();

  @override
  List<Object> get props => [];
}

final class PersonalProfileInitial extends PersonalProfileState {}

class PersonalProfileLoading extends PersonalProfileState {}

class PersonalProfileLoadSuccess extends PersonalProfileState {
  final PersonalProfileEntity entity;

  const PersonalProfileLoadSuccess({required this.entity});
}

class PersonalProfileLoadFailure extends PersonalProfileState {
  final String message;

  const PersonalProfileLoadFailure({required this.message});
}

class PersonalProfileUpdating extends PersonalProfileState {}

class PersonalProfileUpdateSuccess extends PersonalProfileState {}

class PersonalProfileUpdateFailure extends PersonalProfileState {
  final String message;

  const PersonalProfileUpdateFailure({required this.message});
}

class PersonalProfileChangeFailure extends PersonalProfileState {
  final String message;

  const PersonalProfileChangeFailure({required this.message});
}
