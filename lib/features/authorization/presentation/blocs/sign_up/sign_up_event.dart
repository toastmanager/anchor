part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpEmailUpdateEvent extends SignUpEvent {
  final String email;

  const SignUpEmailUpdateEvent({required this.email});
}

class SignUpPasswordUpdateEvent extends SignUpEvent {
  final String password;

  const SignUpPasswordUpdateEvent({required this.password});
}

class SignUpFullNameUpdateEvent extends SignUpEvent {
  final String fullName;

  const SignUpFullNameUpdateEvent({required this.fullName});
}

class SignUpBirthDateUpdateEvent extends SignUpEvent {
  final DateTime birthDate;

  const SignUpBirthDateUpdateEvent({required this.birthDate});
}

class SignUpExecuteEvent extends SignUpEvent {
  final SignUpEntity signUpEntity;

  const SignUpExecuteEvent({required this.signUpEntity});
}
