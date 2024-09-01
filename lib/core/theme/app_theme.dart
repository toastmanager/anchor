import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

class AppTheme {
  static TextTheme textTheme(BuildContext context) =>
      Theme.of(context).textTheme.apply(fontSizeDelta: 2, fontFamily: 'Onest');

  static FilledButtonThemeData filledButtonThemeData = FilledButtonThemeData(
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

  static ButtonStyle bigButton = const ButtonStyle(
      padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 20, vertical: 20)));

  static Color dividerColor(BuildContext context) =>
      Theme.of(context).colorScheme.onSurface.withOpacity(0.15);

  static BorderSide borderSide(BuildContext context) =>
      BorderSide(color: Theme.of(context).dividerColor, width: 1.5);

  static TextStyle? hintStyle(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3));

  static InputDecoration inputDecoration(BuildContext context,
      {String? hintText,
      Widget? suffix,
      Widget? prefix,
      bool enabled = true,
      bool? filled,
      Color? fillColor}) {
    return InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      hintText: hintText,
      hintStyle: AppTheme.hintStyle(context),
      enabled: enabled,
      filled: filled,
      fillColor: fillColor,
      prefix: prefix,
      suffix: suffix,
    );
  }

  static ThemeData lightTheme(BuildContext context) => ThemeData(
        colorScheme: ColorScheme.fromSeed(
                brightness: Brightness.light,
                seedColor: const Color(0xFF554AF0))
            .copyWith(
          primary: const Color(0xFF554AF0),
        ),
        textTheme: textTheme(context),
        fontFamily: 'Onest',
        filledButtonTheme: filledButtonThemeData,
        outlinedButtonTheme: outlinedButtonThemeData(context),
        dividerColor: dividerColor(context),
      );
}
