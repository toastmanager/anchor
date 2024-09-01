import 'package:anchor/features/authorization/domain/entities/sign_in_entity.dart';
import 'package:anchor/features/authorization/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignIn {
  final AuthRepository repository;

  const SignIn({required this.repository});

  void execute(SignInEntity signInEntity) =>
      repository.signIn(signInEntity: signInEntity);
}
