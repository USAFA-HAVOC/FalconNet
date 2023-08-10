import 'package:falcon_net/Structure/Components/InfoBar.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Database/Unit.dart';
import '../../../../../Model/Database/User.dart';

class AssigneeBar extends StatelessWidget {
  final User assignee;
  final List<Unit> units;
  final void Function(User) onAssign;

  const AssigneeBar({super.key, required this.assignee, required this.units, required this.onAssign});

  @override
  Widget build(BuildContext context) {
    List<String> bases = assignee.units
        .where((u) => !assignee.units.any(
            (p) => units.where((o) => o.name == p).any((g) => g.parent_units.toList().contains(u))
        )).toList();

    return InfoBar(
        children: [
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  assignee.personal_info.full_name,
                  style: Theme.of(context).textTheme.titleSmall,
                ),

                Text(bases.reduce((carry, value) => "$carry, $value"))
              ],
            )
          ),

          Expanded(
            flex: 1,
            child: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => onAssign(assignee),
            ),
          )
        ]
    );
  }
}