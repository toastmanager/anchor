import 'package:anchor/features/events/data/datasources/remote/events_remote_datasource.dart';
import 'package:anchor/features/events/data/models/event_model.dart';
import 'package:anchor/features/events/domain/entities/event_entity.dart';
import 'package:anchor/features/events/domain/repositories/events_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: EventsRepository)
class EventsRepositoryImpl implements EventsRepository {
  final EventsRemoteDatasource remoteDatasource;

  const EventsRepositoryImpl({required this.remoteDatasource});

  @override
  Future<void> create(
      {required String name,
      required String description,
      DateTime? startDate,
      int? color,
      String? imageUrl,
      required int reward}) async {
    try {
      await remoteDatasource.insert(
          name: name,
          description: description,
          startDate: startDate,
          color: color,
          imageUrl: imageUrl,
          reward: reward);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> delete({required int id}) async {
    try {
      await remoteDatasource.delete(id: id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<EventEntity>> getCompleted() async {
    try {
      final eventModels = await remoteDatasource.fetchCompleted();
      List<EventEntity> res = [];
      for (var event in eventModels) {
        res.add(event.toEntity());
      }
      return res;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<EventEntity>> getSelected() async {
    try {
      final eventModels = await remoteDatasource.fetchSelected();
      List<EventEntity> res = [];
      for (var event in eventModels) {
        res.add(event.toEntity());
      }
      return res;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<EventEntity>> getUpcoming() async {
    try {
      final eventModels = await remoteDatasource.fetchUpcoming();
      List<EventEntity> res = [];
      for (var event in eventModels) {
        res.add(event.toEntity());
      }
      return res;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> update({required EventEntity entity}) async {
    try {
      await remoteDatasource.update(model: EventModel.fromEntity(entity));
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  Future<bool> switchParticipitationStatus({required int id}) async {
    try {
      final event = await remoteDatasource.fetchEvent(id: id);
      if (event.isParticipant) {
        await remoteDatasource.unparticipate(eventId: id);
        return false;
      } else {
        await remoteDatasource.participate(eventId: id);
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }
}
