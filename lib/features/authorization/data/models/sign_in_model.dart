import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_model.g.dart';

@JsonSerializable()
class SignInModel extends Equatable {
  final String email;
  final String password;

  const SignInModel({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];

  SignInModel copyWith({String? email, String? password}) {
    return SignInModel(
        email: email ?? this.email, password: password ?? this.password);
  }

  @override
  String toString() {
    return 'SignInModel{email=$email, password=$password}';
  }

  Map<String, dynamic> toJson() => _$SignInModelToJson(this);
  factory SignInModel.fromJson(Map<String, dynamic> json) =>
      _$SignInModelFromJson(json);
}
