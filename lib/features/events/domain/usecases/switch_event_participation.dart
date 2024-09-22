import 'package:anchor/features/events/domain/repositories/events_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SwitchEventParticipation {
  final EventsRepository repository;

  const SwitchEventParticipation({required this.repository});

  Future<bool> execute({required int eventId}) async =>
      await repository.switchParticipitationStatus(id: eventId);
}
