import 'package:anchor/screens/events/events_page.dart';
import 'package:anchor/screens/rating_page.dart';
import 'package:anchor/screens/news/news_page.dart';
import 'package:anchor/screens/personal_account/personal_account_page.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:unikit/unikit.dart';
import 'package:intl/date_symbol_data_local.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  int pageIndex = 0;
  final List<Widget> pagesList = <Widget>[
    const NewsPage(),
    const RatingPage(),
    const EventsPage(),
    const PersonalAccountPage(),
  ];

  final List<IconData> unselectedIcons = [
    IconlyLight.discovery,
    IconlyLight.chart,
    IconlyLight.star,
    IconlyLight.profile,
  ];

  final List<IconData> selectedIcons = [
    IconlyBold.discovery,
    IconlyBold.chart,
    IconlyBold.star,
    IconlyBold.profile,
  ];

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = List.from(unselectedIcons);
    icons[pageIndex] = selectedIcons[pageIndex];

    return Scaffold(
      bottomNavigationBar: UniBottomNavBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) => setState(() => pageIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(icons[0]),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(icons[1]),
            label: 'Leaders',
          ),
          BottomNavigationBarItem(
            icon: Icon(icons[2]),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(icons[3]),
            label: 'Profile',
          ),
        ],
        currentIndex: pageIndex,
      ),
      body: pagesList[pageIndex],
    );
  }
}