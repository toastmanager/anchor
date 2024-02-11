import 'package:flutter/material.dart';

class EventCard extends StatefulWidget {
  const EventCard({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.title)
      ],
    );
  }
}