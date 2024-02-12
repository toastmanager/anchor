import 'package:anchor/components/event_card.dart';
import 'package:anchor/models/my_event_model.dart';
import 'package:anchor/models/my_user_model.dart';
import 'package:anchor/screens/events/event_adding_page.dart';
import 'package:anchor/utilities/event_service.dart';
import 'package:anchor/utilities/user_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:unikit/unikit.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> with SingleTickerProviderStateMixin {
  final appBarHeight = kToolbarHeight + 11 + 48 + 1.5 + 11;
  final EventService eventService = EventService();
  final _userService = UserService();
  final int _tabsLength = 3;
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: _tabsLength, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

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

        MyUser user = snapshot.data!;

        final tabs = <Widget>[
          const SizedBox(
            height: 30,
            child: Text('Список')
          ),
          const SizedBox(
            height: 30,
            child: Text('Выбрано'),
          ),
          const SizedBox(
            height: 30,
            child: Text('Завершено', softWrap: false,),
          ),
        ];
        
        final pages = <Widget>[
          futureEvents(),
          choosedEvents(),
          completedEvents(),
        ];


        return Scaffold(
          appBar: UniAppBar(
            centerTitle: true,
            height: appBarHeight,
            title: 'Мероприятия',
            actions: [
              if (user.role == 'moderator')
                IconButton(
                  icon: const Icon(CupertinoIcons.add),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const EventAddingPage(),
                  )),
                ),
            ],
            bottomActions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(IconlyLight.wallet),
                        const SizedBox(width: 8),
                        Text(user.scores.toString()),
                      ],
                    ),
                    const SizedBox(height: 5),
                    TabBar(
                      tabs: tabs,
                      controller: tabController,
                    ),
                  ],
                )
              )
            ],
          ),

          body: TabBarView(
            controller: tabController,
            children: pages,
          ),
        );
      }
    );
  }

  StreamBuilder<QuerySnapshot<Object?>> futureEvents() {
    return StreamBuilder(
      stream: eventService.getFutureEvents(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Center(
            child: Text('Список пуст'),
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
                        backgroundColor: event.backgroundColor,
                      );
                    }
                  );
                }
              );
            },
          ),
        );
      }
    );
  }

  StreamBuilder<QuerySnapshot<Object?>> choosedEvents() {
    return StreamBuilder(
      stream: eventService.getCurrentUserChoosedEvents(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Center(
            child: Text('Список пуст'),
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
    );
  }
  
  StreamBuilder<QuerySnapshot<Object?>> completedEvents() {
    return StreamBuilder(
      stream: eventService.getCurrentUserCompletedEvents(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Center(
            child: Text('Список пуст'),
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
    );
  }
}