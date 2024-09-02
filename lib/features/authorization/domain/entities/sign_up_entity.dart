import 'package:anchor/features/authorization/domain/entities/user_sign_up_entity.dart';
import 'package:equatable/equatable.dart';

class SignUpEntity extends Equatable {
  final String? email;
  final String password;
  final UserSignUpEntity userEntity;

  const SignUpEntity(
      {this.email, required this.password, required this.userEntity});

  @override
  List<Object?> get props => [email, password, userEntity];

  SignUpEntity copyWith(
      {String? email, String? password, UserSignUpEntity? userEntity}) {
    return SignUpEntity(
        email: email ?? this.email,
        password: password ?? this.password,
        userEntity: userEntity ?? this.userEntity);
  }
}
