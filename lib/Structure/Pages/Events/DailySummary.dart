import 'package:falcon_net/Structure/Components/InfoBar.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';

import '../../../Model/Database/AccountabilityEvent.dart';
import '../../../Model/Database/UserEvent.dart';
import '../../Components/PaddedColumn.dart';

class DailySummary extends StatelessWidget {
  final List<UserEvent> events;
  final int day;

  const DailySummary({super.key, required this.events, required this.day});

  List<Widget> buildEventBars(BuildContext context) {
    var target = DateTime.now().add(Duration(days: day));
    var applicable = events.where((e) =>
        e.time.toLocal().year == target.year &&
        e.time.toLocal().month == target.month &&
        e.time.toLocal().day == target.day &&
        e.type != EventType.di.name
    ).toList();

    applicable.sort((a, b) => a.time.compareTo(b.time));

    if (applicable.isEmpty) {
      return [Padding(
        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.1),
        child: const Text(
          "No Events",
          textAlign: TextAlign.center,
        ),
      )];
    }

    return applicable.map((e) => InfoBar(
        children: [
          Expanded(
            flex: 5,
            child: PaddedColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              padding: const EdgeInsets.symmetric(vertical: 2),
              children: [
                Text(
                  e.name ?? "DI",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),

                if (e.description != null) Text(
                  e.description!
                ),

                if (e.type != EventType.di.name) Text(
                  EventTypeNames.parse(e.type).describe(),
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
          ),

          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  describeTime(TimeOfDay.fromDateTime(e.time.toLocal())),
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
          )
        ]
    )).toList();
  }

  @override
  Widget build(BuildContext context) => ListView(
    primary: false,
    children: [
      Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              day == 0 ? "Today" :
                day == 1 ? "Tomorrow" :
                  formatWeekday((DateTime.now().weekday + day - 1) % 7 + 1),
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            ...buildEventBars(context)
          ],
        )
      )
    ],
  );
}