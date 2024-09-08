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
}

@Injectable(as: EventsRemoteDatasource)
class EventsRemoteDatasourceImpl implements EventsRemoteDatasource {
  final SupabaseClient client;
  final Logger logger;

  final tableName = "events";

  const EventsRemoteDatasourceImpl(
      {required this.client, required this.logger});

  @override
  Future<void> delete({required int id}) async {
    try {
      await client.from(tableName).delete().eq('id', id);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<List<EventModel>> fetchCompleted() async {
    // TODO: implement fetchCompleted
    throw UnimplementedError();
  }

  @override
  Future<List<EventModel>> fetchSelected() async {
    // TODO: implement fetchSelected
    throw UnimplementedError();
  }

  @override
  Future<List<EventModel>> fetchUpcoming() async {
    try {
      final query = await client
          .from(tableName)
          .select()
          .gt('start_date', DateSerialization.toJson(DateTime.now()));
      List<EventModel> res = [];
      for (var event in query) {
        res.add(EventModel.fromJson(event));
      }
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
      await client.from(tableName).insert({
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
      await client.from(tableName).update(modelJson).eq('id', model.id);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
