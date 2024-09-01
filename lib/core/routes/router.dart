import 'package:anchor/core/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            path: '/auth',
            initial: true,
            page: AuthChooseRoute.page,
            children: [
              AutoRoute(path: 'sign_in', page: SignInRoute.page),
              AutoRoute(path: 'sign_up', page: SignUpRoute.page),
            ])
      ];
}
