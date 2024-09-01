import 'package:anchor/features/authorization/data/datasources/remote/auth_remote_data_source.dart';
import 'package:anchor/features/authorization/data/models/sign_in_model.dart';
import 'package:anchor/features/authorization/domain/entities/sign_in_entity.dart';
import 'package:anchor/features/authorization/domain/entities/sign_up_entity.dart';
import 'package:anchor/features/authorization/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  const AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<void> signIn({required SignInEntity entity}) async {
    try {
      authRemoteDataSource.signIn(SignInModel.fromEntity(entity));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signUp({required SignUpEntity entity}) async {
    throw UnimplementedError();
  }
}
