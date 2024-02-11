import 'package:anchor/screens/events_page.dart';
import 'package:anchor/screens/leaders_page.dart';
import 'package:anchor/screens/products_page.dart';
import 'package:anchor/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:unikit/unikit.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int pageIndex = 0;
  final List<Widget> pagesList = <Widget>[
    LeadersPage(),
    ProductsPage(),
    EventsPage(),
    ProfilePage(),
  ];

  final List<IconData> unselectedIcons = [
    IconlyLight.home,
    IconlyLight.chat,
    IconlyLight.folder,
    IconlyLight.profile,
  ];

  final List<IconData> selectedIcons = [
    IconlyBold.home,
    IconlyBold.chat,
    IconlyBold.folder,
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
            label: 'Leaders',
          ),
          BottomNavigationBarItem(
            icon: Icon(icons[1]),
            label: 'Products',
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