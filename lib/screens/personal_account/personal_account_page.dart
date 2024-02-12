import 'package:anchor/models/my_user_model.dart';
import 'package:anchor/screens/personal_account/profile_screen.dart';
import 'package:anchor/screens/personal_account/schedule_screen.dart';
import 'package:anchor/screens/personal_account/user_created_events_screen.dart';
import 'package:anchor/utilities/user_service.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:unikit/unikit.dart';

class PersonalAccountPage extends StatefulWidget {
  const PersonalAccountPage({super.key});

  @override
  State<PersonalAccountPage> createState() => _PersonalAccountPageState();
}

class _PersonalAccountPageState extends State<PersonalAccountPage> with SingleTickerProviderStateMixin {
  final UserService userService = UserService();
  late final Future<MyUser?> user;
  
  final appBarHeight = kToolbarHeight + 43 + 30 + 9.5;
  
  late final TabController _tabController;
  final List<Widget> _tabs = [
    const SizedBox(
      width: 85,
      height: 30,
      child: Text(
        'Расписание',
        softWrap: false,
        textAlign: TextAlign.center,
      )
    ),
    const SizedBox(
      width: 100,
      height: 30,
      child: Text(
        'Мероприятия',
        softWrap: false,
        textAlign: TextAlign.center
      )
    ),
    const SizedBox(
      width: 62,
      height: 30,
      child: Text(
        'Профиль',
        softWrap: false,
        textAlign: TextAlign.center
      )
    ),
  ];

  @override
  void initState() {
    user = userService.getCurrentUser();
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: userService.getCurrentUser(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Center(
            child: Text('Список пуст'),
          );
        }

        MyUser user = snapshot.data!;

        final screens = <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height - appBarHeight - 85,
            child: const ScheduleScreen()
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - appBarHeight - 85,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: UserCreatedEventsScreen(),
            ),
          ),
          // const Placeholder(),
          ProfileScreen(
            height: MediaQuery.of(context).size.height - appBarHeight - 85,
            user: user,
            userService: userService,
          ),
        ];

        return Scaffold(
          appBar: UniAppBar(
            title: "Личный кабинет",
            centerTitle: true,
            height: appBarHeight,
            bottomActions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    IconlyLight.wallet,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    user.scores.toString(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TabBar(
                controller: _tabController,
                tabs: _tabs,
              )
            ],
          ),
          body: TabBarView(
            controller: _tabController,
            children: screens,
          ),
        );
      }
    );
  }
}