import 'package:anchor/features/events/domain/repositories/events_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteEvent {
  final EventsRepository repository;

  const DeleteEvent({required this.repository});

  Future<void> execute({required int id}) async =>
      await repository.delete(id: id);
}
