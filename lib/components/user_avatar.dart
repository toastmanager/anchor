import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.imageURL,
    required this.size,
  });

  final String? imageURL;
  final double size;

  @override
  Widget build(BuildContext context) {
    ImageProvider<Object> userImage = imageURL != null
          ? CachedNetworkImageProvider(imageURL!)
          : const AssetImage('assets/images/default_avatar.png') as ImageProvider<Object>;

    return ClipOval(
      child: Image(
        image: userImage,
        height: size,
        width: size,
        fit: BoxFit.cover,
      ),
    );
  }
}