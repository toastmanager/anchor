import 'package:anchor/features/events/domain/entities/event_entity.dart';

abstract class EventsRepository {
  Future<void> create({
    required String name,
    required String description,
    DateTime? startDate,
    int? color,
    String? imageUrl,
    required int reward,
  });

  Future<void> delete({required int id});

  Future<void> update({required EventEntity entity});

  /// Returns true if after switching user is participant and false if user is not
  Future<bool> switchParticipitationStatus({required int id});

  Future<List<EventEntity>> getUpcoming();

  Future<List<EventEntity>> getSelected();

  Future<List<EventEntity>> getCompleted();
}
