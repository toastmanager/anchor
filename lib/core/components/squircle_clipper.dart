import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

class SquircleClipper extends StatelessWidget {
  const SquircleClipper({super.key, required this.child, this.side = BorderSide.none, this.borderRadius = 12});

  final Widget child;
  final BorderSide side;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SmoothClipRRect(
      smoothness: 1,
      borderRadius: BorderRadius.circular(borderRadius),
      side: side,
      child: child);
  }
}