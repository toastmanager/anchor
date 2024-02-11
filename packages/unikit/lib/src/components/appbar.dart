import 'package:flutter/material.dart';
import 'package:unikit/src/components/dividers.dart';

class UniAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UniAppBar({
    super.key,
    this.height = kToolbarHeight,
    this.title,
    this.centerTitle,
    this.leading,
    this.actions,
    this.bottomActions = const [],
  });

  final double height;
  final String? title;
  final bool? centerTitle;
  final Widget? leading;
  final List<Widget>? actions;
  final List<Widget> bottomActions;
  
  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppBar(
          surfaceTintColor: Colors.transparent,
          leading: leading,
          centerTitle: centerTitle,
          iconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.primary,
            size: Theme.of(context).textTheme.titleLarge!.fontSize! + 8
          ),
          actions: actions,
          titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600
          ),
          title: Text(title ?? ''),
        ),
      ] + bottomActions + [
        const SizedBox(height: 10),  
        const UniDividerSmall()
      ],
    );
  }
}