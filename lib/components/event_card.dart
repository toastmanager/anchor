import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:unikit/unikit.dart';

class EventCard extends StatefulWidget {
  const EventCard({
    Key? key,
    required this.title,
    required this.description,
    required this.beginTime,
    required this.cost,
    required this.imageURL,
  }) : super(key: key);

  final String title;
  final String description;
  final Timestamp beginTime;
  final int cost;
  final String imageURL;

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool isShrinked = true;
  bool showDescription = false;

  void switchShrink() {
    setState(() {
      isShrinked = !isShrinked;
      if (isShrinked == true) {
        showDescription = false;
      }
    });
  }

  void switchDescription() {
    setState(() {
      showDescription = !showDescription;
    });
  }

  @override
  Widget build(BuildContext context) {
    final backgroundImage = CachedNetworkImageProvider(widget.imageURL);

    return InkWell(
      onTap: () => switchShrink(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 500),
          alignment: Alignment.topCenter,
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: backgroundImage,
                      alignment: Alignment.topCenter,
                      fit: BoxFit.fitWidth,
                      onError: (exception, stackTrace) => log(exception.toString()),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      const Color(0xFF554AF0),
                      const Color(0xFF554AF0).withAlpha(70),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      widget.title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.background,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _bottomInfo(context, IconlyLight.calendar, "${widget.beginTime.toDate().day}.${widget.beginTime.toDate().month}"),
                        _bottomInfo(context, IconlyLight.time_circle, "${widget.beginTime.toDate().hour}:${widget.beginTime.toDate().minute}"),
                        _bottomInfo(context, IconlyLight.wallet, "${widget.cost}"),
                      ],
                    ),
                    if (showDescription)
                      Column(
                        children: [
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 300,
                            child: SingleChildScrollView(
                              child: Text(
                                widget.description,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Theme.of(context).colorScheme.background
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (isShrinked == false)
                      Column(
                        children: [
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Column(
                                children: [
                                  UniButtonAccentSmall(
                                    text: 'Информация',
                                    height: 20,
                                    width: 90,
                                    backgroundColor: Theme.of(context).colorScheme.background,
                                    foregroundColor: Theme.of(context).colorScheme.primary,
                                    onPressed: () => switchDescription(),
                                  ),
                                  UniButtonAccentSmall(
                                    text: 'Записаться',
                                    height: 20,
                                    width: 90,
                                    backgroundColor: Theme.of(context).colorScheme.background,
                                    foregroundColor: Theme.of(context).colorScheme.primary,
                                    // TODO: event signUp ability
                                    onPressed: () {},
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _bottomInfo(BuildContext context, IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.background,
          size: 20,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.background,
            fontWeight: FontWeight.w500
          ),
        )
      ],
    );
  }
}
