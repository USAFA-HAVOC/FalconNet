import 'package:falcon_net/Model/Database/UserSummary.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Theme.of(context).dividerColor),
        ),

        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    summary.name,
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.start,
                  ),
                ),

                ElevatedButton(
                  onPressed: () => onToggle(summary),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(status == AssignmentStatus.excluded ? "Add" : "Remove"),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}