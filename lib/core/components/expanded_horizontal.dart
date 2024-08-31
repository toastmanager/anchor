import 'package:flutter/material.dart';

class ExpandedHorizontally extends StatelessWidget {
  const ExpandedHorizontally({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Expanded(child: child)],
    );
  }
}
