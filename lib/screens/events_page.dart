import 'package:anchor/components/event_card.dart';
import 'package:anchor/models/my_event_model.dart';
import 'package:anchor/utilities/event_service.dart';
import 'package:anchor/utilities/user_service.dart';
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
  final _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UniAppBar(
        centerTitle: true,
        height: appBarHeight,
        title: 'Мероприятия',
      ),
      body: StreamBuilder(
        stream: eventService.getEvents(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
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
                return FutureBuilder(
                  future: event.isUserParticipate,
                  builder: (context, isUserParticipate) {
                    return FutureBuilder(
                      future: _userService.getUserByUid(event.organizer),
                      builder: (context, organizer) {
                        return EventCard(
                          uid: event.uid,
                          title: event.title,
                          description: event.description,
                          isUserParticipate: isUserParticipate.data,
                          beginTime: event.beginTime,
                          cost: event.cost,
                          organizer: organizer.data,
                          imageURL: event.image,
                        );
                      }
                    );
                  }
                );
              },
            ),
          );
        }
      ),
    );
  }
}