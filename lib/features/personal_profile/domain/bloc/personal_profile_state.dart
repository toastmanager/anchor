part of 'personal_profile_bloc.dart';

sealed class PersonalProfileState extends Equatable {
  const PersonalProfileState();
  
  @override
  List<Object> get props => [];
}

final class PersonalProfileInitial extends PersonalProfileState {}

class PersonalProfileLoading extends PersonalProfileState {}

class PersonalProfileLoadSuccess extends PersonalProfileState {}

class PersonalProfileLoadFailure extends PersonalProfileState {}

class PersonalProfileUpdating extends PersonalProfileState {}

class PersonalProfileUpdateSuccess extends PersonalProfileState {}

class PersonalProfileUpdateFailure extends PersonalProfileState {}