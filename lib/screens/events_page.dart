import 'package:anchor/components/event_card.dart';
import 'package:anchor/models/my_event_model.dart';
import 'package:anchor/models/my_user_model.dart';
import 'package:anchor/screens/event_adding_page.dart';
import 'package:anchor/utilities/event_service.dart';
import 'package:anchor/utilities/user_service.dart';
import 'package:flutter/cupertino.dart';
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
    return FutureBuilder<MyUser?>(
      future: _userService.getCurrentUser(),
      builder: (context, snapshot) {
        if (!snapshot.hasData && snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator()
          ));
        }

        MyUser _user = snapshot.data!;

        return Scaffold(
          appBar: UniAppBar(
            centerTitle: true,
            height: appBarHeight,
            title: 'Мероприятия',
            actions: [
              if (_user.role == 'moderator')
                IconButton(
                  icon: const Icon(CupertinoIcons.add),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const EventAddingPage(),
                  )),
                ),
            ],
          ),
          body: StreamBuilder(
            stream: eventService.getFutureEvents(),
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
    );
  }
}