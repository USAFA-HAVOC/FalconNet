import 'package:falcon_net/Model/Database/AccountabilityEvent.dart';
import 'package:flutter/material.dart';

import '../../../Model/Database/Excusal.dart';
import '../../Components/InfoBar.dart';

class RecurringExcusalDescriptor extends StatelessWidget {
  final RecurringExcusal excusal;
  final void Function() onEdit;
  final void Function() onDelete;

  static const List<String> days = ["M", "Tu", "W", "Th", "F", "Sa", "Su"];

  const RecurringExcusalDescriptor({
    super.key,
    required this.excusal,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    String typesDesc = excusal.event_types
        .map((t) => EventTypeNames.parse(t).describe())
        .reduce((carry, value) => "$carry, $value");

    String timeDesc =
        (RecurringExcusalTypeNames.parse(excusal.recurring_excusal_type) == RecurringExcusalType.days_of_week)
            ? excusal.excused_days!.asMap().entries
                .where((e) => e.value)
                .map((e) => days[e.key])
                .reduce((carry, value) => "$carry, $value")
            : RecurringExcusalTypeNames
                .parse(excusal.recurring_excusal_type)
                .display();

    ExcusalType type = ExcusalTypeNames.parse(excusal.excusal.type);
    String typeDesc = switch (type) {
      ExcusalType.other => excusal.excusal.other_description,
      ExcusalType.sca => "SCA: ${excusal.excusal.sca_number}",
      ExcusalType.bedrest || ExcusalType.ic_status || ExcusalType.los || ExcusalType.gr => type.display()
    }!;

    return InfoBar(
      children: [
        Expanded(
          flex: 3,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  typeDesc,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                Text(
                  typesDesc,
                  style: Theme.of(context).textTheme.titleSmall,
                ),

                Text(
                  timeDesc,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
          )
        ),

        Expanded(
          flex: 1,
          child: IconButton(
            onPressed: onEdit,
            icon: const Icon(Icons.edit),
          )
        ),

        Expanded(
          flex: 1,
          child: IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete),
          )
        ),
      ],
    );
  }
}