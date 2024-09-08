import 'package:anchor/core/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

@RoutePage()
class NavbarScreen extends StatelessWidget {
  const NavbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        PersonalProfileRoute(),
        EventsRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: (value) {
                tabsRouter.setActiveIndex(value);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(TablerIcons.user), label: 'Profile'),
                BottomNavigationBarItem(
                    icon: Icon(TablerIcons.star_filled), label: 'Events'),
              ]),
        );
      },
    );
  }
}
