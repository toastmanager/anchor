part of 'sign_up_bloc.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

class SignUpFailed extends SignUpState {
  final String message;

  const SignUpFailed({required this.message});
}

class SignUpSuccess extends SignUpState {}