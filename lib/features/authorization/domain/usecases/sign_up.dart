import 'package:anchor/features/authorization/domain/entities/sign_up_entity.dart';
import 'package:anchor/features/authorization/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignUp {
  final AuthRepository repository;

  const SignUp({required this.repository});

  void execute(SignUpEntity signUpEntity) =>
      repository.signUp(signUpEntity: signUpEntity);
}
