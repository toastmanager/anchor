import 'package:anchor/utilities/schedule_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:unikit/unikit.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int _weekDay = 0;
  
  final ScheduleService _scheduleService = ScheduleService();

  @override
  Widget build(BuildContext context) {
    final Map<String, bool> weekDays = {
      'Понедельник': false,
      'Вторник': false,
      'Среда': false,
      'Четверг': false,
      'Пятница': false,
      'Суббота': false,
    };
    weekDays[weekDays.keys.elementAt(_weekDay)] = true;

    return FutureBuilder(
      future: _scheduleService.getSunsScedule(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Center(
            child: Text('Список пуст'),
          );
        }

        final schedules = snapshot.data!;

        return Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: 35,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: weekDays.length,
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
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Image(
                  image: CachedNetworkImageProvider(
                    schedules[_weekDay]
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
            )
          ],
        );
      }
    );
  }
}