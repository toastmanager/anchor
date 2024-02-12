import 'package:anchor/models/my_user_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.user,
    required this.size,
  });

  final MyUser? user;
  final double size;

  @override
  Widget build(BuildContext context) {
    ImageProvider<Object> userImage = user?.picture != null
          ? CachedNetworkImageProvider(user!.picture!)
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