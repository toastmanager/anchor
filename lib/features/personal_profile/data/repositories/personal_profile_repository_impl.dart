import 'package:anchor/features/personal_profile/data/datasources/remote/personal_profile_remote_datasource.dart';
import 'package:anchor/features/personal_profile/data/models/personal_profile_model.dart';
import 'package:anchor/features/personal_profile/domain/entities/personal_profile_entity.dart';
import 'package:anchor/features/personal_profile/domain/repositories/personal_profile_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PersonalProfileRepository)
class PersonalProfileRepositoryImpl implements PersonalProfileRepository {
  final PersonalProfileRemoteDatasource datasource;

  const PersonalProfileRepositoryImpl({required this.datasource});

  @override
  Future<PersonalProfileEntity> get() async {
    try {
      return (await datasource.getCurrentUser()).toEntity();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await datasource.signOut();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> update(PersonalProfileEntity entity) async {
    try {
      await datasource
          .updateCurrentUser(PersonalProfileModel.fromEntity(entity));
    } catch (e) {
      rethrow;
    }
  }
}
