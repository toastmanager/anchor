import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

class SquircleClipper extends StatelessWidget {
  const SquircleClipper({super.key, required this.child, this.side = BorderSide.none});

  final Widget child;
  final BorderSide side;

  @override
  Widget build(BuildContext context) {
    return SmoothClipRRect(
      smoothness: 1,
      borderRadius: BorderRadius.circular(12),
      side: side,
      child: child);
  }
}