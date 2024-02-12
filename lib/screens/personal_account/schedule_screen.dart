import 'package:flutter/material.dart';
import 'package:unikit/unikit.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int _weekDay = 0;
  
  @override
  Widget build(BuildContext context) {
    final Map<String, bool> weekDays = {
      'Понедельник': false,
      'Вторник': false,
      'Среда': false,
      'Четверг': false,
      'Пятница': false,
      'Суббота': false,
      'Воскресенье': false,
    };
    weekDays[weekDays.keys.elementAt(_weekDay)] = true;

    return Column(
      children: [
        const SizedBox(height: 10),
        SizedBox(
          height: 35,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            separatorBuilder: (context, index) => const SizedBox(width: 6),
            itemBuilder: (context, index) => Expanded(
              child: UniButtonSecondarySmall(
                text: weekDays.keys.elementAt(index),
                onPressed: () => setState(() => _weekDay = index),
                padding: const EdgeInsets.symmetric(horizontal: 3),
                backgroundColor: weekDays.values.elementAt(index)
                    ? Theme.of(context).colorScheme.primary
                    : null,
                foregroundColor: weekDays.values.elementAt(index)
                    ? Theme.of(context).colorScheme.background
                    : null,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}