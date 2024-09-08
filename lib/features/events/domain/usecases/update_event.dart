import 'package:anchor/features/events/domain/entities/event_entity.dart';
import 'package:anchor/features/events/domain/repositories/events_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateEvent {
  final EventsRepository repository;

  const UpdateEvent({required this.repository});

  Future<void> execute({required EventEntity entity}) async =>
      await repository.update(entity: entity);
}
