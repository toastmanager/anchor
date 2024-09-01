import 'package:anchor/features/authorization/domain/entities/sign_in_entity.dart';
import 'package:anchor/features/authorization/domain/entities/sign_up_entity.dart';

abstract class AuthRepository {
  Future<void> signIn({required SignInEntity entity});
  Future<void> signUp({required SignUpEntity entity});  
}