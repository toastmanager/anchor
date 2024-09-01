import 'package:anchor/features/authorization/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

class SignUpModel extends Equatable {
  final String email;
  final String password;
  final UserModel userModel;

  const SignUpModel(
      {required this.email, required this.password, required this.userModel});

  @override
  List<Object?> get props => [email, password, userModel];

  SignUpModel copyWith(
      {String? email, String? password, UserModel? userModel}) {
    return SignUpModel(
        email: email ?? this.email,
        password: password ?? this.password,
        userModel: userModel ?? this.userModel);
  }
}
