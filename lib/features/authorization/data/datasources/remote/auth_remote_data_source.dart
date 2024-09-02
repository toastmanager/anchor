import 'package:anchor/features/authorization/data/models/sign_in_model.dart';
import 'package:anchor/features/authorization/data/models/sign_up_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDataSource {
  Future<void> signIn(SignInModel model);
  Future<void> signUp(SignUpModel model);
}

@Singleton(as: AuthRemoteDataSource)
class AuthorizationRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient client;

  const AuthorizationRemoteDataSourceImpl({required this.client});

  @override
  signIn(model) async {
    try {
      await client.auth
          .signInWithPassword(email: model.email, password: model.password);
    } catch (e) {
      rethrow;
    }
  }

  @override
  signUp(model) async {
    try {
      await client.auth.signUp(
        email: model.email,
        password: model.password,
        data: model.userModel.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }
}
