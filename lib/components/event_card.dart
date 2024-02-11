import 'dart:developer';
import 'package:anchor/models/my_user_model.dart';
import 'package:anchor/utilities/event_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
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
  }) : super(key: key);

  final String uid;
  final String title;
  final String description;
  final Timestamp beginTime;
  final int cost;
  final String imageURL;
  final bool? isUserParticipate;
  final MyUser? organizer;

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
    ImageProvider<Object> organizerImage = widget.organizer?.picture != null
        ? CachedNetworkImageProvider(widget.organizer!.picture!)
        : const AssetImage('assets/images/default_avatar.png') as ImageProvider<Object>;
    
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
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.primary.withAlpha(100),
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
                        _bottomInfo(context, IconlyLight.calendar, "${widget.beginTime.toDate().day}.${widget.beginTime.toDate().month}"),
                        _bottomInfo(context, IconlyLight.time_circle, "${widget.beginTime.toDate().hour}:${widget.beginTime.toDate().minute}"),
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
                                  ClipOval(
                                    child: Image(
                                      image: organizerImage,
                                      height: 40,
                                      width: 40,
                                      fit: BoxFit.fill,
                                    ),
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
                                    text: signText,
                                    height: 20,
                                    width: 90,
                                    backgroundColor: Theme.of(context).colorScheme.background,
                                    foregroundColor: Theme.of(context).colorScheme.primary,
                                    onPressed: () => signAction(),
                                  ),
                                ],
                              ),
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
