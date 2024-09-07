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
    gh.lazySingleton<_i974.Logger>(() => loggerModule.logger);
    gh.lazySingleton<_i454.Supabase>(() => supabaseModule.supabase);
    gh.lazySingleton<_i454.SupabaseClient>(() => supabaseModule.supabaseClient);
    gh.singleton<_i969.AuthRemoteDataSource>(() =>
        _i969.AuthorizationRemoteDataSourceImpl(
            client: gh<_i454.SupabaseClient>()));
    gh.singleton<_i66.AppRouter>(
        () => _i66.AppRouter(client: gh<_i454.SupabaseClient>()));
    gh.lazySingleton<_i76.AuthRepository>(() => _i1046.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i969.AuthRemoteDataSource>()));
    gh.lazySingleton<_i560.SignIn>(
        () => _i560.SignIn(repository: gh<_i76.AuthRepository>()));
    gh.lazySingleton<_i963.SignUp>(
        () => _i963.SignUp(repository: gh<_i76.AuthRepository>()));
    gh.factory<_i413.SignUpBloc>(
        () => _i413.SignUpBloc(signUp: gh<_i963.SignUp>()));
    gh.factory<_i618.SignInBloc>(
        () => _i618.SignInBloc(signIn: gh<_i560.SignIn>()));
    return this;
  }
}

class _$LoggerModule extends _i987.LoggerModule {}

class _$SupabaseModule extends _i695.SupabaseModule {}
