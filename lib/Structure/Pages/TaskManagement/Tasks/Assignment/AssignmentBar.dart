import 'package:falcon_net/Model/Database/UserSummary.dart';
import 'package:falcon_net/Structure/Components/InfoBar.dart';
import 'package:flutter/material.dart';

enum AssignmentStatus {
  included,
  excluded,
}

class AssignmentBar extends StatelessWidget {
  final AssignmentStatus status;
  final UserSummary summary;
  final void Function(UserSummary) onToggle;

  const AssignmentBar({super.key, required this.summary, required this.status, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return InfoBar(
      children: [
        Expanded(
          child: Text(
            summary.name,
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.start,
          ),
        ),

        IconButton(
          onPressed: () => onToggle(summary),
          icon: Icon(status == AssignmentStatus.excluded ? Icons.add : Icons.delete),
        )
      ],
    );
  }
}