// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:anchor/features/authorization/presentation/pages/auth_choose_page.dart'
    as _i1;
import 'package:anchor/features/authorization/presentation/pages/sign_in_page.dart'
    as _i2;
import 'package:anchor/features/authorization/presentation/pages/sign_up_page.dart'
    as _i3;
import 'package:auto_route/auto_route.dart' as _i4;

/// generated route for
/// [_i1.AuthChoosePage]
class AuthChooseRoute extends _i4.PageRouteInfo<void> {
  const AuthChooseRoute({List<_i4.PageRouteInfo>? children})
      : super(
          AuthChooseRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthChooseRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthChoosePage();
    },
  );
}

/// generated route for
/// [_i2.SignInPage]
class SignInRoute extends _i4.PageRouteInfo<void> {
  const SignInRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.SignInPage();
    },
  );
}

/// generated route for
/// [_i3.SignUpPage]
class SignUpRoute extends _i4.PageRouteInfo<void> {
  const SignUpRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.SignUpPage();
    },
  );
}
