import 'package:flutter/material.dart';
import 'package:unikit/src/components/dividers.dart';

class UniBottomNavBar extends StatelessWidget {
  const UniBottomNavBar({
    super.key,
    this.currentIndex = 0, 
    required this.items,
    this.onTap,
    this.showSelectedLabels,
    this.showUnselectedLabels,
  });

  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final void Function(int)? onTap;
  final bool? showSelectedLabels;
  final bool? showUnselectedLabels;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const UniDividerSmall(),
        BottomNavigationBar(
          showSelectedLabels: showSelectedLabels,
          showUnselectedLabels: showUnselectedLabels,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.primary,
          ),
          selectedItemColor: Theme.of(context).colorScheme.onSurface,
          unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
          backgroundColor: Theme.of(context).colorScheme.background,
          items: items,
          elevation: 0,
          currentIndex: currentIndex,
          onTap: onTap,
        ),
      ],
    );
  }
}