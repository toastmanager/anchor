import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

class AppTheme {
  static TextTheme textTheme(BuildContext context) =>
      Theme.of(context).textTheme.apply(fontSizeDelta: 2, fontFamily: 'Onest');

  static FilledButtonThemeData filledButtonThemeData(BuildContext context) =>
      FilledButtonThemeData(
          style: ButtonStyle(
              padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 20, vertical: 16)),
              shape: WidgetStatePropertyAll(SmoothRectangleBorder(
                smoothness: 1,
                borderRadius: BorderRadius.circular(12),
              ))));

  static OutlinedButtonThemeData outlinedButtonThemeData(
          BuildContext context) =>
      OutlinedButtonThemeData(
          style: ButtonStyle(
              padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 20, vertical: 16)),
              shape: WidgetStatePropertyAll(SmoothRectangleBorder(
                  smoothness: 1, borderRadius: BorderRadius.circular(12))),
              foregroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.onSurface)));

  static ThemeData lightTheme(BuildContext context) => ThemeData(
        colorScheme: ColorScheme.fromSeed(
                brightness: Brightness.light, seedColor: const Color(0xFF554AF0))
            .copyWith(
          primary: const Color(0xFF554AF0),
        ),
        textTheme: textTheme(context),
        filledButtonTheme: filledButtonThemeData(context),
        outlinedButtonTheme: outlinedButtonThemeData(context),
      );
}
