import 'package:anchor/features/authorization/data/datasources/remote/auth_remote_data_source.dart';
import 'package:anchor/features/authorization/data/models/sign_in_model.dart';
import 'package:anchor/features/authorization/data/models/sign_up_model.dart';
import 'package:anchor/features/authorization/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  const AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  signIn({required entity}) async {
    try {
      await authRemoteDataSource.signIn(SignInModel.fromEntity(entity));
    } catch (e) {
      rethrow;
    }
  }

  @override
  signUp({required entity}) async {
    try {
      await authRemoteDataSource.signUp(SignUpModel.fromEntity(entity));
    } catch (e) {
      rethrow;
    }
  }
}
