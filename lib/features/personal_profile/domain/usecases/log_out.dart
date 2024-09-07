import 'package:anchor/features/personal_profile/domain/repositories/personal_profile_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LogOut {
  final PersonalProfileRepository repository;

  const LogOut({required this.repository});

  Future<void> execute() async => await repository.logOut();
}
