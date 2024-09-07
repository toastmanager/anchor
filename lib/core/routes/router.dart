import 'package:anchor/core/routes/guards/auth_guard.dart';
import 'package:anchor/core/routes/router.gr.dart';
import 'package:anchor/core/routes/routes.dart';
import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  final SupabaseClient client;

  AppRouter({required this.client});

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: Routes.auth,
          page: AuthChooseRoute.page,
        ),
        AutoRoute(path: Routes.signIn, page: SignInRoute.page),
        AutoRoute(path: Routes.signUp, page: SignUpRoute.page),
        AutoRoute(
          path: Routes.events,
          initial: true,
          page: EventsRoute.page,
        )
      ];

  @override
  List<AutoRouteGuard> get guards => [AuthGuard(client: client)];
}
