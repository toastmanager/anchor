import 'package:anchor/core/utils/date_serialization.dart';
import 'package:anchor/features/events/data/models/event_model.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class EventsRemoteDatasource {
  Future<void> insert({
    required String name,
    required String description,
    DateTime? startDate,
    int? color,
    String? imageUrl,
    required int reward,
  });

  Future<void> delete({required int id});

  Future<void> update({required EventModel model});

  Future<List<EventModel>> fetchUpcoming();

  Future<List<EventModel>> fetchSelected();

  Future<List<EventModel>> fetchCompleted();

  Future<void> participate({required int eventId});
  
  Future<void> unparticipate({required int eventId});

  Future<EventModel> fetchEvent({required int id});
}

@Injectable(as: EventsRemoteDatasource)
class EventsRemoteDatasourceImpl implements EventsRemoteDatasource {
  final SupabaseClient client;
  final Logger logger;

  final eventsTable = "events";
  final participantsTable = "participants";

  const EventsRemoteDatasourceImpl(
      {required this.client, required this.logger});

  @override
  Future<void> delete({required int id}) async {
    try {
      await client.from(eventsTable).delete().eq('id', id);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<List<EventModel>> fetchCompleted() async {
    final currentUser = client.auth.currentUser;
    if (currentUser == null) {
      const message =
          'currentUser is empty when trying to fetch completed events';
      logger.e(message);
      throw message;
    }
    try {
      final eventsQuery = await client
          .from(eventsTable)
          .select('*, $participantsTable!inner(user_id)')
          .lte('start_date', DateSerialization.toJson(DateTime.now()))
          .eq('$participantsTable.user_id', currentUser.id);
      final res = eventsQuery
          .map((e) => EventModel.fromJson(e).copyWith(isParticipant: true))
          .toList();
      logger.i('fetched completed events $res');
      return res;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<List<EventModel>> fetchSelected() async {
    final currentUser = client.auth.currentUser;
    if (currentUser == null) {
      const message =
          'currentUser is empty when trying to fetch selected events';
      logger.e(message);
      throw message;
    }
    try {
      final eventsQuery = await client
          .from(eventsTable)
          .select('*, $participantsTable!inner(user_id)')
          .gt('start_date', DateSerialization.toJson(DateTime.now()))
          .eq('$participantsTable.user_id', currentUser.id);
      final res = eventsQuery
          .map((e) => EventModel.fromJson(e).copyWith(isParticipant: true))
          .toList();
      logger.i('fetched selected events $res');
      return res;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<List<EventModel>> fetchUpcoming() async {
    final currentUser = client.auth.currentUser;
    try {
      final eventsQuery = await client
          .from(eventsTable)
          .select('*, participants(*)')
          .gt('start_date', DateSerialization.toJson(DateTime.now()));
      List<EventModel> res = [];
      for (var event in eventsQuery) {
        bool isParticipant = false;
        for (var participant in event[participantsTable]) {
          if ((participant['user_id']) == currentUser?.id) {
            isParticipant = true;
            break;
          }
        }
        res.add(
            EventModel.fromJson(event).copyWith(isParticipant: isParticipant));
      }
      logger.i('fetched upcoming events $res');
      return res;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<void> insert(
      {required String name,
      required String description,
      DateTime? startDate,
      int? color,
      String? imageUrl,
      required int reward}) async {
    try {
      await client.from(eventsTable).insert({
        name: name,
        description: description,
        'start_date': startDate,
        color: color,
        'image_url': imageUrl,
        reward: reward
      });
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<void> update({required EventModel model}) async {
    try {
      final modelJson = model.toJson();
      modelJson.remove('id');
      await client.from(eventsTable).update(modelJson).eq('id', model.id);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<void> participate({required int eventId}) async {
    final currentUser = client.auth.currentUser;
    if (currentUser == null) {
      const message =
          'currentUser is empty when trying to fetch completed events';
      logger.e(message);
      throw message;
    }
    try {
      await client
          .from(participantsTable)
          .insert({'user_id': currentUser.id, 'event_id': eventId});
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<void> unparticipate({required int eventId}) async {
    final currentUser = client.auth.currentUser;
    if (currentUser == null) {
      const message =
          'currentUser is empty when trying to fetch completed events';
      logger.e(message);
      throw message;
    }
    try {
      await client
          .from(participantsTable)
          .delete()
          .eq('user_id', currentUser.id)
          .eq('event_id', eventId);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<EventModel> fetchEvent({required int id}) async {
    final currentUser = client.auth.currentUser;
    try {
      final eventQuery = (await client
              .from(eventsTable)
              .select('*, participants(*)')
              .eq('id', id))
          .first;
      bool isParticipant = false;
      for (var participant in eventQuery[participantsTable]) {
        if ((participant['user_id']) == currentUser?.id) {
          isParticipant = true;
          break;
        }
      }
      return EventModel.fromJson(eventQuery)
          .copyWith(isParticipant: isParticipant);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
