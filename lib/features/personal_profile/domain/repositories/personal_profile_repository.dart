import 'package:anchor/features/personal_profile/domain/entities/personal_profile_entity.dart';

abstract class PersonalProfileRepository {
  Future<void> update(PersonalProfileEntity entity);
  Future<PersonalProfileEntity> get();
  Future<void> logOut();
}