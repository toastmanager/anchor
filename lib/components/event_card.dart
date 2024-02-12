import 'dart:developer';
import 'package:anchor/components/user_avatar.dart';
import 'package:anchor/models/my_user_model.dart';
import 'package:anchor/utilities/event_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:unikit/unikit.dart';

class EventCard extends StatefulWidget {
  const EventCard({
    Key? key,
    required this.uid,
    required this.title,
    required this.description,
    required this.isUserParticipate,
    required this.beginTime,
    required this.cost,
    required this.imageURL,
    required this.organizer,
    this.backgroundColor,
  }) : super(key: key);

  final String uid;
  final String title;
  final String description;
  final Timestamp beginTime;
  final int cost;
  final String imageURL;
  final bool? isUserParticipate;
  final MyUser? organizer;
  final String? backgroundColor;

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  final EventService _eventService = EventService();

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
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    String signText = 'Записаться';
    Function signAction = () => _eventService.eventSignUp(widget.uid);;

    if (widget.isUserParticipate != null && widget.isUserParticipate!) {
      signText = 'Отписаться';
      signAction = () => _eventService.eventUnsign(widget.uid);
    }

    ImageProvider<Object> backgroundImage = CachedNetworkImageProvider(widget.imageURL);
    Color _backgroundColor = 
      widget.backgroundColor == '' || widget.backgroundColor == null
      ? Theme.of(context).colorScheme.primary
      : Color(int.parse("0xFF${widget.backgroundColor!}"));

    return AnimatedSize(
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
      alignment: Alignment.topCenter,
      child: InkWell(
        onTap: () => switchShrink(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
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
                      _backgroundColor,
                      _backgroundColor.withAlpha(100),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        _bottomInfo(context, IconlyLight.calendar, DateFormat('d MMMM', "ru").format(widget.beginTime.toDate())),
                        _bottomInfo(context, IconlyLight.time_circle, DateFormat('HH:MM', "ru").format(widget.beginTime.toDate())),
                        _bottomInfo(context, IconlyLight.wallet, "${widget.cost}"),
                      ],
                    ),
                    if (showDescription)
                      Column(
                        children: [
                          const SizedBox(height: 16),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxHeight: 250,
                            ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  UserAvatar(
                                    user: widget.organizer,
                                    size: 40
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    widget.organizer!.fullname
                                      .split(" ")
                                      .sublist(0, 2)
                                      .join(" "),
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Theme.of(context).colorScheme.background
                                    ),
                                  )
                                ],
                              ),
                              actions(context, signText, signAction),
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

  Widget actions(BuildContext context, String signText, Function signAction) {
    return Column(
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
          text: signText,
          height: 20,
          width: 90,
          backgroundColor: Theme.of(context).colorScheme.background,
          foregroundColor: Theme.of(context).colorScheme.primary,
          onPressed: widget.beginTime.toDate().isAfter(DateTime.now()) ? () => signAction() : null,
        ),
      ],
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
