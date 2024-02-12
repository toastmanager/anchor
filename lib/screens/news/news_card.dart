import 'package:anchor/models/my_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatefulWidget {
  const NewsCard({
    super.key,
    required this.author,
    required this.likesAmount,
    required this.createdAt,
    required this.description,
    this.imageURL,
  });

  final MyUser author;
  final int likesAmount;
  final Timestamp createdAt;
  final String description;
  final String? imageURL;

  @override
  State<NewsCard> createState() => _NewsState();
}

class _NewsState extends State<NewsCard> {

  @override
  Widget build(BuildContext context) {
    final author = widget.author;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(author.fullname
              .split(" ")
              .sublist(0, 2)
              .join(" "))
          ],
        )
      ],
    );
  }
}
