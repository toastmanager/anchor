import 'package:anchor/features/authorization/domain/entities/auth.dart';

abstract class AuthRepository {
  void signUp({required SignUpEntity signUpEntity});  
  void signIn({required SignInEntity signInEntity});
}