import 'package:anchor/core/components/squircle_clipper.dart';
import 'package:anchor/features/events/domain/blocs/events_bloc/events_bloc.dart';
import 'package:anchor/features/events/domain/entities/event_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:intl/intl.dart';

class UpcomingEventCard extends StatefulWidget {
  const UpcomingEventCard({
    super.key,
    required this.event,
  });

  final EventEntity event;

  @override
  State<UpcomingEventCard> createState() => _UpcomingEventCardState();
}

class _UpcomingEventCardState extends State<UpcomingEventCard> {
  bool isDescriptionOpen = false;
  bool isActionsOpen = false;

  void switchDescriptionOpening() {
    setState(() {
      isDescriptionOpen = !isDescriptionOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EventsBloc>();
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final EventEntity event = widget.event;
    Color cardColor = event.color == null
        ? colorScheme.primary
        : Color(event.color!);

    return AnimatedSize(
      alignment: Alignment.topCenter,
      duration: Durations.long1,
      child: SquircleClipper(
        child: InkWell(
          onTap: () {
            setState(() {
              isActionsOpen = !isActionsOpen;
              if (isDescriptionOpen && !isActionsOpen) {
                isDescriptionOpen = !isDescriptionOpen;
              }
            });
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            constraints: const BoxConstraints(maxHeight: 470),
            decoration: BoxDecoration(
              color: cardColor.withOpacity(0.7),
              image: event.imageUrl != null
                  ? DecorationImage(
                      image: NetworkImage(event.imageUrl!),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          cardColor.withOpacity(0.7), BlendMode.srcOver),
                      // opacity: 0.35
                    )
                  : null,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  event.name,
                  style: textTheme.bodyMedium
                      ?.copyWith(
                          color: colorScheme.onPrimary,
                          fontWeight: FontWeight.w600)
                      .apply(fontSizeDelta: 2),
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (event.startDate != null)
                      Row(
                        children: [
                          Icon(
                            TablerIcons.calendar,
                            color: colorScheme.onPrimary.withOpacity(0.7),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            DateFormat.d()
                                .add_MMM()
                                .format(event.startDate!),
                            style: textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onPrimary,
                            ),
                          )
                        ],
                      ),
                    Row(
                      children: [
                        Icon(
                          TablerIcons.clock,
                          color: colorScheme.onPrimary.withOpacity(0.7),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          DateFormat.Hm().format(event.startDate!),
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onPrimary,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          TablerIcons.coins,
                          color: colorScheme.onPrimary.withOpacity(0.7),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          DateFormat.Hm().format(event.startDate!),
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onPrimary,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                if (isDescriptionOpen) ...[
                  const SizedBox(
                    height: 14,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        event.description,
                        style: textTheme.bodyMedium
                            ?.copyWith(color: colorScheme.onPrimary),
                      ),
                    ),
                  )
                ],
                if (isActionsOpen) ...[
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          if (isDescriptionOpen)
                            OutlinedButton(
                                style: ButtonStyle(
                                    side: WidgetStatePropertyAll(BorderSide(
                                        color: colorScheme.onPrimary)),
                                    foregroundColor: WidgetStatePropertyAll(
                                        colorScheme.onPrimary)),
                                onPressed: switchDescriptionOpening,
                                child: const Text('Close')),
                          if (!isDescriptionOpen)
                            FilledButton(
                                style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      colorScheme.onPrimary),
                                  foregroundColor: WidgetStatePropertyAll(
                                      colorScheme.primary),
                                ),
                                onPressed: switchDescriptionOpening,
                                child: const Text('Information')),
                          const SizedBox(
                            height: 8,
                          ),
                          if (event.isParticipant)
                            OutlinedButton(
                                style: ButtonStyle(
                                    side: WidgetStatePropertyAll(
                                        BorderSide(color: colorScheme.onPrimary)),
                                    foregroundColor: WidgetStatePropertyAll(
                                        colorScheme.onPrimary)),
                                onPressed: () {
                                  bloc.add(EventsSwitchParticipation(
                                      eventId: event.id));
                                },
                                child: const Text('Unparticipate')),
                          if (!event.isParticipant)
                            FilledButton(
                                style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      colorScheme.onPrimary),
                                  foregroundColor:
                                      WidgetStatePropertyAll(colorScheme.primary),
                                ),
                                onPressed: () {
                                  bloc.add(EventsSwitchParticipation(
                                      eventId: event.id));
                                },
                                child: const Text('Participate')),
                        ],
                      )
                    ],
                  )
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
