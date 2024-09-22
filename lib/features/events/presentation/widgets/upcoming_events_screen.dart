import 'package:anchor/features/events/domain/blocs/events_bloc/events_bloc.dart';
import 'package:anchor/features/events/presentation/widgets/upcoming_event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingEventsScreen extends StatelessWidget {
  const UpcomingEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      context.read<EventsBloc>().add(EventsUpcomingLoad());
      return BlocBuilder<EventsBloc, EventsState>(
        buildWhen: (context, state) {
          return state is! EventsUpcomingLoading && state is! EventsInitial;
        },
        builder: (context, state) {
          if (state is EventsUpcomingLoadSuccess) {
            final events = state.events;
            if (events.isEmpty) {
              return const Center(child: Text('No upcoming events'));
            }
            return ListView.separated(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return UpcomingEventCard(event: event);
              },
              separatorBuilder: (context, index) => const SizedBox(height: 8),
            );
          }
          return const Text('Unexpected Error');
        },
      );
    });
  }
}
