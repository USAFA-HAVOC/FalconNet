import 'package:falcon_net/Model/Database/UnitList.dart';
import 'package:falcon_net/Model/Database/UnitSummary.dart';
import 'package:falcon_net/Structure/Components/InfoBar.dart';
import 'package:flutter/material.dart';

import '../../../../Components/ConfirmationDialog.dart';
import '../../../../Components/PaddedColumn.dart';
import 'UnitForm.dart';

class UnitBar extends StatelessWidget {
  final UnitSummary unit;
  final void Function(UnitSummary) onDelete;
  final void Function(UnitSummary) onEdit;
  final UnitList list;

  const UnitBar({super.key, required this.unit, required this.onDelete, required this.onEdit, required this.list});

  void attemptDelete(BuildContext context) {
    if (unit.total == 0) {
      showDialog(context: context, builder: (context) => ConfirmationDialog(
        title: "Confirm Deletion",
        description: "Please confirm you would like to delete unit ${unit.unit.name}. This action cannot be undone.",
        onConfirm: () => onDelete(unit),
      ));
    }

    else {
      showDialog(context: context, builder: (context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: PaddedColumn(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
              children: [

                Text(
                  "Unit Not Empty",
                  style: Theme.of(context).textTheme.titleMedium,
                ),

                PaddedColumn(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  children: [
                    Text(
                      "Cannot delete units with currently assigned members. In order to delete this unit, "
                          "its members must be assigned to another unit. This is to prevent homeless cadets.",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text('Acknowledge'),
                      ),
                    ),
                  ],
                ),
              ]
          ),
        ),
      ));
    }
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
                unit.unit.name,
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.start,
              ),

              Text(
                unit.unit.parent ?? "None",
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