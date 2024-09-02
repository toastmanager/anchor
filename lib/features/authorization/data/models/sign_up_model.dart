import 'package:anchor/features/authorization/domain/entities/sign_up_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:anchor/features/authorization/data/models/user_sign_up_model.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SignUpModel extends Equatable {
  final String? email;
  final String password;
  @JsonKey(name: 'data')
  final UserSignUpModel userModel;

  const SignUpModel(
      {this.email, required this.password, required this.userModel});

  factory SignUpModel.fromEntity(SignUpEntity entity) {
    return SignUpModel(
        email: entity.email,
        password: entity.password,
        userModel: UserSignUpModel.fromEntity(entity.userEntity));
  }

  SignUpEntity toEntity() {
    return SignUpEntity(
        email: email, password: password, userEntity: userModel.toEntity());
  }

  @override
  List<Object?> get props => [email, password, userModel];

  SignUpModel copyWith(
      {String? email, String? password, UserSignUpModel? userModel}) {
    return SignUpModel(
        email: email ?? this.email,
        password: password ?? this.password,
        userModel: userModel ?? this.userModel);
  }

  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);
  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);
}
