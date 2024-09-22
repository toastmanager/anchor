import 'package:anchor/features/events/domain/blocs/events_bloc/events_bloc.dart';
import 'package:anchor/features/events/presentation/widgets/upcoming_events_screen.dart';
import 'package:anchor/injection.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<EventsBloc>(),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: UpcomingEventsScreen(),
      ),
    );
  }
}
