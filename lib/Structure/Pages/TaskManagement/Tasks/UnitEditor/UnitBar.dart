import 'package:falcon_net/Model/Database/UnitList.dart';
import 'package:falcon_net/Structure/Components/InfoBar.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Database/Unit.dart';
import '../../../../Components/ConfirmationDialog.dart';
import 'UnitForm.dart';

class UnitBar extends StatelessWidget {
  final Unit unit;
  final void Function(Unit) onDelete;
  final void Function(Unit) onEdit;
  final UnitList list;

  const UnitBar({super.key, required this.unit, required this.onDelete, required this.onEdit, required this.list});

  void attemptDelete(BuildContext context) {
    if (unit.sub_units.isEmpty) {
      showDialog(context: context, builder: (context) => ConfirmationDialog(
        title: "Confirm Deletion",
        description: "Please confirm you would like to delete unit ${unit.name}. This action cannot be undone.",
        onConfirm: () => onDelete(unit),
      ));
    }
    else {
      showDialog(context: context, builder: (context) => ConfirmationDialog(
        title: "Confirm Deletion",
        description: "Please confirm you would like to delete unit ${unit.name}. This action cannot be undone.",
        onConfirm: () => onDelete(unit),
      ));
    }
    unit;
  }

  @override
  Widget build(BuildContext context) {
    return InfoBar(
      children: [
        Expanded(
          flex: 12,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                unit.name,
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.start,
              ),

              Text(
                unit.parent_units.isNotEmpty ? unit.parent_units.last : "None",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),

        Expanded(
          flex: 3,
          child: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => showDialog(
                context: context,
                builder: (context) => Dialog(
                  backgroundColor: Theme.of(context).cardTheme.color,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: UnitForm(
                      existing: unit,
                      onSubmit: onEdit,
                      list: list,
                    ),
                  ),
                )
            ),
          ),
        ),

        Expanded(
          flex: 3,
          child: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => attemptDelete(context),
          ),
        ),
      ],
    );
  }
}