import 'package:anchor/features/events/domain/entities/event_entity.dart';
import 'package:anchor/features/events/domain/repositories/events_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUpcomingEvents {
  final EventsRepository repository;

  const GetUpcomingEvents({required this.repository});

  Future<List<EventEntity>> execute() async => await repository.getUpcoming();
}
