import 'package:anchor/screens/welcome_page/welcome_page.dart';
import 'package:anchor/utilities/user_service.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late final TabController tabController;
  final int tabsAmount = 1;

  @override
  void initState() {
    tabController = TabController(length: tabsAmount, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabsList = <Widget>[
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                child: Text(
                  'Выйти',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                onPressed: () async {
                  await UserService().logOut();
                  if (mounted) {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => const WelcomePage(),
                    ));
                  }
                },
              ),
              TextButton(
                child: const Text(
                  'Редактировать',
                ),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 40,
            child: TabBarView(
              controller: tabController,
              children: tabsList,
            ),
          ),
        ),
      ),
    );
  }
}