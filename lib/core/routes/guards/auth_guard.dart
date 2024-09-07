import 'package:anchor/core/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGuard extends AutoRouteGuard {
  final SupabaseClient client;

  const AuthGuard({required this.client});

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (client.auth.currentUser == null) {
      resolver.redirect(AuthChooseRoute(onResult: (result) {
        if (result == true) {
          resolver.next(true);
        }
      }));
    } else {
      resolver.next(true);
    }
  }
}
