import 'package:anchor/components/event_card.dart';
import 'package:anchor/models/my_event_model.dart';
import 'package:anchor/utilities/event_service.dart';
import 'package:flutter/material.dart';
import 'package:unikit/unikit.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final appBarHeight = kToolbarHeight + 11;
  final EventService eventService = EventService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UniAppBar(
        centerTitle: true,
        height: appBarHeight,
      ),
      body: StreamBuilder(
        stream: eventService.getEvents(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return const Center(
              child: Text('no data'),
            );
          }

          List events = snapshot.data?.docs ?? [];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.separated(
              itemCount: events.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                MyEvent event = events[index].data();
                return EventCard(
                  title: event.title,
                  description: event.description,
                  beginTime: event.beginTime,
                  cost: event.cost,
                  imageURL: event.image,
                );
              },
            ),
          );
        }
      ),
    );
  }
}