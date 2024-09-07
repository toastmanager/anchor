import 'package:anchor/injection.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@RoutePage()
class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () async {
              try {
                await sl<SupabaseClient>().auth.signOut();
              } catch (e) {
                rethrow;
              }
            },
            child: const Text('Sign Out')),
      ),
    );
  }
}
