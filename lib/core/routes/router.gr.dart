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
    as _i5;
import 'package:anchor/features/authorization/presentation/pages/sign_up_page.dart'
    as _i6;
import 'package:anchor/features/events/presentation/pages/events_page.dart'
    as _i2;
import 'package:anchor/features/personal_profile/presentation/pages/profile_page.dart'
    as _i4;
import 'package:anchor/navbar_screen.dart' as _i3;
import 'package:auto_route/auto_route.dart' as _i7;

/// generated route for
/// [_i1.AuthChoosePage]
class AuthChooseRoute extends _i7.PageRouteInfo<void> {
  const AuthChooseRoute({List<_i7.PageRouteInfo>? children})
      : super(
          AuthChooseRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthChooseRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthChoosePage();
    },
  );
}

/// generated route for
/// [_i2.EventsPage]
class EventsRoute extends _i7.PageRouteInfo<void> {
  const EventsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          EventsRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.EventsPage();
    },
  );
}

/// generated route for
/// [_i3.NavbarScreen]
class NavbarRoute extends _i7.PageRouteInfo<void> {
  const NavbarRoute({List<_i7.PageRouteInfo>? children})
      : super(
          NavbarRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavbarRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.NavbarScreen();
    },
  );
}

/// generated route for
/// [_i4.PersonalProfilePage]
class PersonalProfileRoute extends _i7.PageRouteInfo<void> {
  const PersonalProfileRoute({List<_i7.PageRouteInfo>? children})
      : super(
          PersonalProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersonalProfileRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.PersonalProfilePage();
    },
  );
}

/// generated route for
/// [_i5.SignInPage]
class SignInRoute extends _i7.PageRouteInfo<void> {
  const SignInRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.SignInPage();
    },
  );
}

/// generated route for
/// [_i6.SignUpPage]
class SignUpRoute extends _i7.PageRouteInfo<void> {
  const SignUpRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.SignUpPage();
    },
  );
}
