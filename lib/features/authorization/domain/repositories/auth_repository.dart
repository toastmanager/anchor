import 'package:anchor/features/authorization/domain/entities/sign_in_entity.dart';
import 'package:anchor/features/authorization/domain/entities/sign_up_entity.dart';

abstract class AuthRepository {
  void signUp({required SignUpEntity signUpEntity});  
  void signIn({required SignInEntity signInEntity});
}