import 'package:falcon_net/Theme/NegativeButtonTheme.dart';
import 'package:flutter/material.dart';

import '../../../../Components/PaddedColumn.dart';

class AssignmentSubform extends StatefulWidget {
  final List<String> assignable;
  final void Function(String) onSelect;

  const AssignmentSubform({super.key, required this.assignable, required this.onSelect});

  @override
  State<StatefulWidget> createState() => AssignmentSubformState();
}

class AssignmentSubformState extends State<AssignmentSubform> {
  late String value;

  @override
  void initState() {
    value = widget.assignable.first;
    print(widget.assignable.where((e) => widget.assignable.where((o) => e == o).length > 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Dialog(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: PaddedColumn(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        padding: const EdgeInsets.all(10),
        children: [
          Text(
            "Add Unit",
            style: Theme.of(context).textTheme.titleMedium,
          ),

          DropdownButton<String>(
              value: value,
              items: widget.assignable.map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e)
              )).toList(),
              onChanged: (change) => setState(() => value = change!)
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: Theme.of(context).extension<NegativeButtonTheme>()!.style,
                  child: const Text("Cancel")
              ),

              ElevatedButton(
                  onPressed: () {
                    widget.onSelect(value);
                    Navigator.of(context).pop();
                  },
                  child: const Text("Save")
              ),
            ],
          )
        ],
      ),
    ),
  );
}