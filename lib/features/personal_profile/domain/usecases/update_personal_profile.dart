import 'package:anchor/features/personal_profile/domain/entities/personal_profile_entity.dart';
import 'package:anchor/features/personal_profile/domain/repositories/personal_profile_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdatePersonalProfile {
  final PersonalProfileRepository repository;

  const UpdatePersonalProfile({required this.repository});

  Future<void> execute(PersonalProfileEntity entity) async =>
      await repository.update(entity);
}
