import 'package:anchor/features/events/domain/repositories/events_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreateEvent {
  final EventsRepository repository;

  const CreateEvent({required this.repository});

  Future<void> execute({
    required String name,
    required String description,
    DateTime? startDate,
    int? color,
    String? imageUrl,
    required int reward,
  }) async =>
      await repository.create(
          name: name,
          description: description,
          startDate: startDate,
          color: color,
          imageUrl: imageUrl,
          reward: reward);
}
