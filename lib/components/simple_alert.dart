import 'package:flutter/material.dart';

simpleAlert(String text, BuildContext context) => showDialog(
  context: context,
  builder: (context) => Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.surface,
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text.splitMapJoin(
                RegExp(r"\[[^\]]*\] "),
                onMatch: (p0) => '',
                onNonMatch: (p0) => p0,
              ),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        )
      ),
    ),
  ),
);