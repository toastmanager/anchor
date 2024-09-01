import 'package:anchor/features/authorization/domain/entities/sign_in_entity.dart';
import 'package:anchor/features/authorization/domain/entities/sign_up_entity.dart';
import 'package:anchor/features/authorization/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  @override
  void signIn({required SignInEntity signInEntity}) {
    throw UnimplementedError();
  }

  @override
  void signUp({required SignUpEntity signUpEntity}) {
    throw UnimplementedError();
  }
}
