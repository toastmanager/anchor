import 'package:flutter/material.dart';

class UniDivider extends StatelessWidget {
  const UniDivider({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                color: Theme.of(context).colorScheme.outlineVariant,
                height: height,
              ),
              Container(
                color: Theme.of(context).colorScheme.outline,
                height: 0.5,
              ),
            ],
          )
        )
      ],
    );
  }
}

class UniDividerSmall extends StatelessWidget {
  const UniDividerSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return const UniDivider(height: 0.5);
  }
}

class UniDividerMedium extends StatelessWidget {
  const UniDividerMedium({super.key});

  @override
  Widget build(BuildContext context) {
    return const UniDivider(height: 4);
  }
}

class UniDividerLarge extends StatelessWidget {
  const UniDividerLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return const UniDivider(height: 8);
  }
}

class UniDividerBig extends StatelessWidget {
  const UniDividerBig({super.key});

  @override
  Widget build(BuildContext context) {
    return const UniDivider(height: 16);
  }
}
