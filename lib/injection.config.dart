// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

import 'core/routes/router.dart' as _i66;
import 'features/authorization/data/datasources/remote/auth_remote_data_source.dart'
    as _i969;
import 'features/authorization/data/repositories/auth_repository.dart'
    as _i1046;
import 'features/authorization/domain/repositories/auth_repository.dart'
    as _i76;
import 'features/authorization/domain/usecases/sign_in.dart' as _i560;
import 'features/authorization/domain/usecases/sign_up.dart' as _i963;
import 'features/authorization/presentation/blocs/sign_in/sign_in_bloc.dart'
    as _i618;
import 'features/authorization/presentation/blocs/sign_up/sign_up_bloc.dart'
    as _i413;
import 'features/events/data/datasources/remote/events_remote_datasource.dart'
    as _i1010;
import 'features/events/data/repositories/events_repository_impl.dart'
    as _i1032;
import 'features/events/domain/blocs/create_event_bloc/create_event_bloc.dart'
    as _i800;
import 'features/events/domain/blocs/events_bloc/events_bloc.dart' as _i926;
import 'features/events/domain/repositories/events_repository.dart' as _i244;
import 'features/events/domain/usecases/create_event.dart' as _i883;
import 'features/events/domain/usecases/delete_event.dart' as _i179;
import 'features/events/domain/usecases/get_completed_events.dart' as _i569;
import 'features/events/domain/usecases/get_selected_events.dart' as _i842;
import 'features/events/domain/usecases/get_upcoming_events.dart' as _i245;
import 'features/events/domain/usecases/update_event.dart' as _i742;
import 'features/personal_profile/data/datasources/remote/personal_profile_remote_datasource.dart'
    as _i966;
import 'features/personal_profile/data/repositories/personal_profile_repository_impl.dart'
    as _i248;
import 'features/personal_profile/domain/bloc/personal_profile_bloc.dart'
    as _i260;
import 'features/personal_profile/domain/repositories/personal_profile_repository.dart'
    as _i16;
import 'features/personal_profile/domain/usecases/get_personal_profile.dart'
    as _i128;
import 'features/personal_profile/domain/usecases/log_out.dart' as _i689;
import 'features/personal_profile/domain/usecases/update_personal_profile.dart'
    as _i73;
import 'logger_module.dart' as _i987;
import 'supabase_module.dart' as _i695;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final loggerModule = _$LoggerModule();
    final supabaseModule = _$SupabaseModule();
    gh.factory<_i800.CreateEventBloc>(() => _i800.CreateEventBloc());
    gh.lazySingleton<_i974.Logger>(() => loggerModule.logger);
    gh.lazySingleton<_i454.Supabase>(() => supabaseModule.supabase);
    gh.lazySingleton<_i454.SupabaseClient>(() => supabaseModule.supabaseClient);
    gh.factory<_i1010.EventsRemoteDatasource>(
        () => _i1010.EventsRemoteDatasourceImpl(
              client: gh<_i454.SupabaseClient>(),
              logger: gh<_i974.Logger>(),
            ));
    gh.lazySingleton<_i966.PersonalProfileRemoteDatasource>(
        () => _i966.PersonalProfileRemoteDatasourceImpl(
              client: gh<_i454.SupabaseClient>(),
              logger: gh<_i974.Logger>(),
            ));
    gh.singleton<_i969.AuthRemoteDataSource>(() =>
        _i969.AuthorizationRemoteDataSourceImpl(
            client: gh<_i454.SupabaseClient>()));
    gh.singleton<_i66.AppRouter>(
        () => _i66.AppRouter(client: gh<_i454.SupabaseClient>()));
    gh.lazySingleton<_i244.EventsRepository>(() => _i1032.EventsRepositoryImpl(
        remoteDatasource: gh<_i1010.EventsRemoteDatasource>()));
    gh.lazySingleton<_i16.PersonalProfileRepository>(() =>
        _i248.PersonalProfileRepositoryImpl(
            datasource: gh<_i966.PersonalProfileRemoteDatasource>()));
    gh.lazySingleton<_i76.AuthRepository>(() => _i1046.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i969.AuthRemoteDataSource>()));
    gh.lazySingleton<_i883.CreateEvent>(
        () => _i883.CreateEvent(repository: gh<_i244.EventsRepository>()));
    gh.lazySingleton<_i179.DeleteEvent>(
        () => _i179.DeleteEvent(repository: gh<_i244.EventsRepository>()));
    gh.lazySingleton<_i569.GetCompletedEvents>(() =>
        _i569.GetCompletedEvents(repository: gh<_i244.EventsRepository>()));
    gh.lazySingleton<_i842.GetSelectedEvents>(() =>
        _i842.GetSelectedEvents(repository: gh<_i244.EventsRepository>()));
    gh.lazySingleton<_i245.GetUpcomingEvents>(() =>
        _i245.GetUpcomingEvents(repository: gh<_i244.EventsRepository>()));
    gh.lazySingleton<_i742.UpdateEvent>(
        () => _i742.UpdateEvent(repository: gh<_i244.EventsRepository>()));
    gh.lazySingleton<_i128.GetPersonalProfile>(() => _i128.GetPersonalProfile(
        repository: gh<_i16.PersonalProfileRepository>()));
    gh.lazySingleton<_i689.LogOut>(
        () => _i689.LogOut(repository: gh<_i16.PersonalProfileRepository>()));
    gh.lazySingleton<_i73.UpdatePersonalProfile>(() =>
        _i73.UpdatePersonalProfile(
            repository: gh<_i16.PersonalProfileRepository>()));
    gh.lazySingleton<_i560.SignIn>(
        () => _i560.SignIn(repository: gh<_i76.AuthRepository>()));
    gh.lazySingleton<_i963.SignUp>(
        () => _i963.SignUp(repository: gh<_i76.AuthRepository>()));
    gh.factory<_i260.PersonalProfileBloc>(() => _i260.PersonalProfileBloc(
          getPersonalProfile: gh<_i128.GetPersonalProfile>(),
          logOut: gh<_i689.LogOut>(),
          updatePersonalProfile: gh<_i73.UpdatePersonalProfile>(),
        ));
    gh.factory<_i413.SignUpBloc>(
        () => _i413.SignUpBloc(signUp: gh<_i963.SignUp>()));
    gh.factory<_i618.SignInBloc>(
        () => _i618.SignInBloc(signIn: gh<_i560.SignIn>()));
    gh.factory<_i926.EventsBloc>(() => _i926.EventsBloc(
          getCompletedEvents: gh<_i569.GetCompletedEvents>(),
          getSelectedEvents: gh<_i842.GetSelectedEvents>(),
          getUpcomingEvents: gh<_i245.GetUpcomingEvents>(),
        ));
    return this;
  }
}

class _$LoggerModule extends _i987.LoggerModule {}

class _$SupabaseModule extends _i695.SupabaseModule {}
