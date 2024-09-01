import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class EyeToggleButton extends StatelessWidget {
  const EyeToggleButton({super.key, this.onTap, this.isOpen = false});

  final void Function()? onTap;
  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    IconData iconData = TablerIcons.eye_closed;
    if (isOpen) {
      iconData = TablerIcons.eye;
    }

    return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Icon(iconData));
  }
}
