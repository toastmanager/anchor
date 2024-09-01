part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInEmailUpdateEvent extends SignInEvent {
  final String email;

  const SignInEmailUpdateEvent({required this.email});
}

class SignInPasswordUpdateEvent extends SignInEvent {
  final String password;

  const SignInPasswordUpdateEvent({required this.password});
}

class SignInExecuteEvent extends SignInEvent {}
