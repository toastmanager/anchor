import 'package:anchor/core/routes/router.gr.dart';
import 'package:anchor/core/routes/routes.dart';
import 'package:auto_route/auto_route.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGuard extends AutoRouteGuard {
  final SupabaseClient client;

  AuthGuard({required this.client});

  final routes = [
    Routes.auth,
    Routes.signIn,
    Routes.signUp
  ];

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (routes.contains('/${resolver.route.fullPath.split('/')[1]}')) {
      resolver.next(true);
      return;
    }
    if (client.auth.currentUser == null) {
      resolver.next(false);
      resolver.redirect(const AuthChooseRoute());
      return;
    } else {
      resolver.next(true);
      return;
    }
  }
}
