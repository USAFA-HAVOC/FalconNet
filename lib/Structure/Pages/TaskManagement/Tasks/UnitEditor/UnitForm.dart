import 'package:falcon_net/Model/Database/UnitList.dart';
import 'package:falcon_net/Model/Database/UnitSummary.dart';
import 'package:falcon_net/Structure/Components/PaddedColumn.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Database/Unit.dart';

class UnitForm extends StatefulWidget {
  final void Function()? onCancel;
  final void Function(UnitSummary) onSubmit;
  final UnitSummary? existing;
  final UnitList list;

  const UnitForm(
      {super.key,
      this.onCancel,
      required this.onSubmit,
      required this.list,
      this.existing});

  @override
  State<StatefulWidget> createState() => UnitFormState();
}

class UnitFormState extends State<UnitForm> {
  late TextEditingController name;
  late TextEditingController group;
  String? nameError;

  @override
  void initState() {
    name = TextEditingController(text: widget.existing?.unit.name ?? "");
    group = TextEditingController(text: widget.existing?.unit.group ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cancel = [];
    if (widget.existing != null) {
      cancel = [
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.grey),
            ),
            onPressed: () {
              widget.onCancel?.call();
              Navigator.of(context).pop();
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text("Cancel"),
            ))
      ];
    }

    return PaddedColumn(
      padding: const EdgeInsets.symmetric(vertical: 10),
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: name,
          readOnly: widget.existing != null,
          decoration: InputDecoration(
              fillColor: widget.existing != null
                  ? Theme.of(context).disabledColor
                  : null,
              filled: widget.existing != null,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).dividerColor),
                  borderRadius: BorderRadius.circular(10)),
              labelStyle: Theme.of(context).textTheme.bodyLarge,
              labelText: "Unit Name",
              suffixIcon: const Icon(Icons.person),
              errorText: nameError),
        ),
        TextField(
          controller: group,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).dividerColor),
                  borderRadius: BorderRadius.circular(10)),
              labelStyle: Theme.of(context).textTheme.bodyLarge,
              labelText: "Group",
              suffixIcon: const Icon(Icons.people)),
        ),
        ElevatedButton(
          onPressed: () {
            if (widget.list.units.any((u) =>
                    u.unit.name.toLowerCase() == name.text.toLowerCase()) &&
                widget.existing == null) {
              setState(() {
                nameError = "Duplicate unit name";
              });
            } else if (name.text.isEmpty) {
              setState(() {
                nameError = "Unit name cannot be blank";
              });
            } else {
              widget.onSubmit(UnitSummary((s) => s
                ..out = widget.existing?.out ?? 0
                ..signed = widget.existing?.signed ?? 0
                ..unsigned = widget.existing?.unsigned ?? 0
                ..total = widget.existing?.total ?? 0
                ..unit = Unit((u) => u
                  ..name = name.text
                  ..group = group.text.isEmpty ? null : group.text
                  ..is_squadron = widget.existing?.unit.is_squadron ?? false
                  ..pass_status = widget.existing?.unit.pass_status ?? "OPEN"
                  ..id = widget.existing?.unit.id).toBuilder()));

              setState(() {
                name.text = "";
                group.text = "";
                nameError = null;
              });

              if (widget.existing != null) {
                Navigator.of(context).pop();
              }
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(widget.existing == null ? "Add Unit" : "Set Unit"),
          ),
        ),
        ...cancel
      ],
    );
  }
}