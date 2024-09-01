import 'package:anchor/features/authorization/domain/entities/sign_up_entity.dart';
import 'package:anchor/features/authorization/domain/usecases/sign_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUp signUp;

  SignUpBloc({required this.signUp}) : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
