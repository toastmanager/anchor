import 'package:flutter/material.dart';

class UniButtonAccentMedium extends StatelessWidget {
  const UniButtonAccentMedium({
    super.key,
    required this.text,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
    this.shadowColor = Colors.transparent,
  });

  final String text;
  final Function()? onPressed;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color shadowColor;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return UniButtonAccent(
      text: text,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      onPressed: onPressed,
      textStyle: Theme.of(context).textTheme.labelMedium,
      shadowColor: shadowColor,
      padding: padding,
    );
  }
}

class UniButtonSecondaryMedium extends StatelessWidget {
  const UniButtonSecondaryMedium({
    super.key,
    required this.text,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
    this.shadowColor = Colors.transparent,
  });

  final String text;
  final Function()? onPressed;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color shadowColor;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return UniButtonSecondary(
      text: text,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      onPressed: onPressed,
      padding: padding,
      textStyle: Theme.of(context).textTheme.labelMedium,
    );
  }
}

class UniButtonAccentSmall extends StatelessWidget {
  const UniButtonAccentSmall({
    super.key,
    required this.text,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    this.shadowColor = Colors.transparent,
  });

  final String text;
  final Function()? onPressed;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color shadowColor;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return UniButtonAccent(
      text: text,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      onPressed: onPressed,
      textStyle: Theme.of(context).textTheme.labelSmall,
      shadowColor: shadowColor,
      padding: padding,
    );
  }
}

class UniButtonSecondarySmall extends StatelessWidget {
  const UniButtonSecondarySmall({
    super.key,
    required this.text,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    this.shadowColor = Colors.transparent,
  });

  final String text;
  final Function()? onPressed;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color shadowColor;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return UniButtonSecondary(
      text: text,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      onPressed: onPressed,
      textStyle: Theme.of(context).textTheme.labelSmall,
      shadowColor: shadowColor,
      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
      padding: padding,
    );
  }
}

class UniButtonAccent extends StatelessWidget {
  const UniButtonAccent({
    super.key,
    required this.text,
    required this.textStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
    this.shadowColor = Colors.transparent,
  });

  final String text;
  final Function()? onPressed;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextStyle? textStyle;
  final Color shadowColor;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return UniElevatedButton(
      text: text, 
      textStyle: textStyle, 
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      shadowColor: shadowColor,
      onPressed: onPressed,
      padding: padding,
    );
  }
}

class UniButtonSecondary extends StatelessWidget {
  const UniButtonSecondary({
    super.key,
    required this.text,
    required this.textStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
    this.shadowColor = Colors.transparent,
    this.borderSide = BorderSide.none,
  });

  final String text;
  final Function()? onPressed;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextStyle? textStyle;
  final BorderSide borderSide;
  final Color shadowColor;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return UniElevatedButton(
      text: text, 
      textStyle: textStyle,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.primary,
      borderSide: borderSide,
      padding: padding,
      shadowColor: shadowColor,
      onPressed: onPressed,
    );
  }
}

class UniElevatedButton extends StatelessWidget {
  const UniElevatedButton({
    Key? key,
    required this.text,
    required this.textStyle,
    required this.backgroundColor,
    required this.foregroundColor,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
    this.borderSide = BorderSide.none,
    this.shadowColor = Colors.transparent,
  }) : super(key: key);

  final String text;
  final Function()? onPressed;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextStyle? textStyle;
  final EdgeInsets padding;
  final BorderSide borderSide;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    final double iconSize = textStyle!.fontSize! + 8.0;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: borderSide,
        ),
        padding: padding,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        textStyle: textStyle,
        shadowColor: shadowColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (prefixIcon != null)
            Icon(
              prefixIcon,
              size: iconSize,
            ),
          if (prefixIcon != null) const SizedBox(width: 8),
          Text(text),
          if (suffixIcon != null) const SizedBox(width: 8),
          if (suffixIcon != null)
            Icon(
              suffixIcon,
              size: iconSize,
            ),
        ],
      ),
    );
  }
}

