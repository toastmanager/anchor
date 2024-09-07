import 'package:anchor/features/authorization/domain/entities/sign_in_entity.dart';
import 'package:anchor/features/authorization/domain/usecases/sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

@injectable
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignIn signIn;
  SignInEntity _signInEntity =
      const SignInEntity(email: '', password: '');

  SignInBloc({required this.signIn}) : super(SignInInitial()) {
    on<SignInEmailUpdateEvent>(_onEmailUpdate);
    on<SignInPasswordUpdateEvent>(_onPasswordUpdate);
    on<SignInExecuteEvent>(_onSignInUpdate);
  }

  void _onEmailUpdate(SignInEmailUpdateEvent event, Emitter<SignInState> emit) {
    _signInEntity = _signInEntity.copyWith(email: event.email);
  }

  void _onPasswordUpdate(
      SignInPasswordUpdateEvent event, Emitter<SignInState> emit) {
    _signInEntity = _signInEntity.copyWith(password: event.password);
  }

  Future<void> _onSignInUpdate(SignInExecuteEvent event, Emitter<SignInState> emit) async {
    try {
      await signIn.execute(_signInEntity);
      emit(SignInSuccess());
    } catch (e) {
      emit(const SignInFailed(message: 'Failed to sign in with give credentials'));
    }
  }
}
