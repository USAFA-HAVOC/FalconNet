import 'package:falcon_net/Model/Database/TimedRole.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Delegation/RoleSubform.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';

class RoleBar extends StatelessWidget {
  final TimedRole existing;
  final List<TimedRole> applicable;
  final void Function() onRemove;
  final void Function(TimedRole) onSubmit;

  const RoleBar(
      {super.key,
      required this.existing,
      required this.applicable,
      required this.onSubmit,
      required this.onRemove});

  @override
  Widget build(BuildContext context) => Padding(
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
                    flex: 3,
                    child: Text(
                      existing.role,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Text(
                        existing.start != null || existing.end != null
                            ? "${describeDate(existing.start!)} - ${describeDate(existing.end!)}"
                            : "Indefinite",
                        style: Theme.of(context).textTheme.bodyMedium,
                      )),
                  Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => showDialog(
                            context: context,
                            builder: (context) => RoleSubform(
                                existing: existing,
                                onSubmit: onSubmit,
                                applicable: applicable)),
                      )),
                  Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: onRemove,
                      )),
                ],
              ),
            )),
      );
}
