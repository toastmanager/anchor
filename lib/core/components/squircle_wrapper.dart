import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

class SquircleWrapper extends StatelessWidget {
  const SquircleWrapper({super.key, required this.child, this.side = BorderSide.none});

  final Widget child;
  final BorderSide side;

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      smoothness: 1,
      borderRadius: BorderRadius.circular(12),
      side: side,
      child: child,
    );
  }
}