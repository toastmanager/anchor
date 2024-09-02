import 'package:anchor/features/authorization/domain/entities/sign_up_entity.dart';
import 'package:anchor/features/authorization/domain/entities/user_sign_up_entity.dart';
import 'package:anchor/features/authorization/domain/usecases/sign_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUp signUp;
  SignUpEntity signUpEntity = SignUpEntity(
      email: '',
      password: '',
      userEntity: UserSignUpEntity(fullName: '', birthDate: DateTime.now()));

  SignUpBloc({required this.signUp}) : super(SignUpInitial()) {
    on<SignUpEmailUpdateEvent>(_onEmailUpdate);
    on<SignUpPasswordUpdateEvent>(_onPasswordUpdate);
    on<SignUpFullNameUpdateEvent>(_onFullNameUpdate);
    on<SignUpBirthDateUpdateEvent>(_onBirthDateUpdate);
    on<SignUpExecuteEvent>(_onSignUp);
  }

  void _onEmailUpdate(SignUpEmailUpdateEvent event, Emitter<SignUpState> emit) {
    signUpEntity = signUpEntity.copyWith(email: event.email);
  }

  void _onPasswordUpdate(
      SignUpPasswordUpdateEvent event, Emitter<SignUpState> emit) {
    signUpEntity = signUpEntity.copyWith(password: event.password);
  }

  void _onFullNameUpdate(
      SignUpFullNameUpdateEvent event, Emitter<SignUpState> emit) {
    signUpEntity = signUpEntity.copyWith(
        userEntity: signUpEntity.userEntity.copyWith(fullName: event.fullName));
  }

  void _onBirthDateUpdate(
      SignUpBirthDateUpdateEvent event, Emitter<SignUpState> emit) {
    signUpEntity = signUpEntity.copyWith(
        userEntity:
            signUpEntity.userEntity.copyWith(birthDate: event.birthDate));
  }

  void _onSignUp(SignUpExecuteEvent event, Emitter<SignUpState> emit) {
    signUp.execute(signUpEntity);
  }
}
