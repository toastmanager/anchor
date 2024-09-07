import 'package:anchor/features/personal_profile/domain/entities/personal_profile_entity.dart';
import 'package:anchor/features/personal_profile/domain/repositories/personal_profile_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPersonalProfile {
  final PersonalProfileRepository repository;

  const GetPersonalProfile({required this.repository});

  Future<PersonalProfileEntity> execute() async => await repository.get();
}
