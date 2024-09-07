import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    this.avatarUrl,
    this.size = 80,
  });

  final String? avatarUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          border:
              Border.all(width: 1.5, color: Theme.of(context).dividerColor),
          shape: BoxShape.circle),
      child: ClipOval(
        child: avatarUrl == null
            ? Container(
                height: size - 6,
                width: size - 6,
                color:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                child: Icon(
                  Icons.person_rounded,
                  size: size - 6,
                ),
              )
            : _avatar(),
      ),
    );
  }

  Image _avatar() {
    return Image.network(
      avatarUrl!,
      height: size - 6,
      width: size - 6,
      fit: BoxFit.cover,
    );
  }
}
