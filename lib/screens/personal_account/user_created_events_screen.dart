import 'package:anchor/screens/events/event_card.dart';
import 'package:anchor/models/my_event_model.dart';
import 'package:anchor/utilities/event_service.dart';
import 'package:anchor/utilities/user_service.dart';
import 'package:flutter/material.dart';

class UserCreatedEventsScreen extends StatefulWidget {
  const UserCreatedEventsScreen({super.key});

  @override
  State<UserCreatedEventsScreen> createState() => _UserCreatedEventsScreenState();
}

class _UserCreatedEventsScreenState extends State<UserCreatedEventsScreen> {
  late final EventService _eventService;
  late final UserService _userService;

  @override
  void initState() {
    super.initState();
    _eventService = EventService();
    _userService = UserService();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _eventService.getCurrentUserCreatedEvents(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData || (snapshot.data?.docs.isEmpty ?? true)) {
          return const Center(child: Text('Список пуст'));
        }

        List events = snapshot.data!.docs;
        
        return ListView.separated(
          itemCount: events.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            MyEvent event = events[index].data() as MyEvent;

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
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}