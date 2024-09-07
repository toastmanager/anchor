import 'package:anchor/features/personal_profile/data/models/personal_profile_model.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class PersonalProfileRemoteDatasource {
  Future<PersonalProfileModel> getCurrentUser();
  Future<void> updateCurrentUser(PersonalProfileModel model);
  Future<void> signOut();
}

@LazySingleton(as: PersonalProfileRemoteDatasource)
class PersonalProfileRemoteDatasourceImpl
    implements PersonalProfileRemoteDatasource {
  final SupabaseClient client;
  final Logger logger;

  const PersonalProfileRemoteDatasourceImpl(
      {required this.client, required this.logger});

  @override
  Future<PersonalProfileModel> getCurrentUser() async {
    final currentUser = client.auth.currentUser;
    if (currentUser != null) {
      try {
        final query = (await client
                .from('users')
                .select('*')
                .eq('id', client.auth.currentUser!.id))
            .first;
        return PersonalProfileModel.fromJson(query);
      } catch (e) {
        logger.e(e);
        rethrow;
      }
    } else {
      const message = 'currentUser is empty';
      logger.e(message);
      throw message;
    }
  }

  @override
  Future<void> signOut() async {
    final currentUser = client.auth.currentUser;
    if (currentUser != null) {
      try {
        await client.auth.signOut();
      } catch (e) {
        logger.e(e);
        rethrow;
      }
    } else {
      const message = 'currentUser is empty';
      logger.e(message);
      throw message;
    }
  }

  @override
  Future<void> updateCurrentUser(PersonalProfileModel model) async {
    final currentUser = client.auth.currentUser;
    if (currentUser != null) {
      try {
        var modelData = model.toJson();
        modelData.remove('id');
        await client.auth.updateUser(UserAttributes(
            email: model.email == currentUser.email ? null : model.email,
            data: modelData));
      } catch (e) {
        logger.e(e);
        rethrow;
      }
    } else {
      const message = 'personal profile model is empty';
      logger.e(message);
      throw message;
    }
  }
}
