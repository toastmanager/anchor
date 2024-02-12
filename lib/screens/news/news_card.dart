import 'package:anchor/components/strings.dart';
import 'package:anchor/components/user_avatar.dart';
import 'package:anchor/models/my_user_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

class NewsCard extends StatefulWidget {
  const NewsCard({
    super.key,
    required this.author,
    required this.isLiked,
    required this.likesAmount,
    required this.createdAt,
    required this.description,
    required this.onLike,
    this.imageURL,
  });

  final MyUser author;
  final bool isLiked;
  final int likesAmount;
  final Timestamp createdAt;
  final String description;
  final String? imageURL;
  final Function(bool) onLike;

  @override
  State<NewsCard> createState() => _NewsState();
}

class _NewsState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    final author = widget.author;

    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: postTop(author, context),
          ),
          if (widget.imageURL != null)
            const SizedBox(height: 16),
          if (widget.imageURL != null)
            Image(
              image: CachedNetworkImageProvider(widget.imageURL!),
              fit: BoxFit.cover,
            ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SelectableText(widget.description),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                postBottomButton(
                  widget.isLiked ? IconlyBold.heart : IconlyLight.heart,
                  widget.likesAmount.toString(),
                  () => widget.onLike(widget.isLiked),
                  // ignore: unnecessary_null_comparison
                  iconColor: widget.isLiked == null ? null : Theme.of(context).colorScheme.primary,
                ),
                InkWell(
                  child: const Icon(IconlyLight.bookmark),
                  onTap: () {}, 
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget postBottomButton(
    IconData icon,
    String text,
    Function action,
    {
      Color? iconColor,
    }
  ) {
    return InkWell(
      onTap: () => action(),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor
          ),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }

  Row postTop(MyUser author, BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              UserAvatar(
                imageURL: author.picture,
                size: 36,
              ),
              const SizedBox(width: 10),
              Text(
                nameSurname(author.fullname),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          Text(
            DateFormat('d MMMM yyyy', 'ru')
              .format(widget.createdAt.toDate()),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600
            ),
          )
        ],
      );
  }
}
