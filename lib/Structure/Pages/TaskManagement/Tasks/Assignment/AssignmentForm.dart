import 'package:built_collection/built_collection.dart';
import 'package:falcon_net/Model/Database/UnitAssignRequest.dart';
import 'package:falcon_net/Structure/Components/InfoBar.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Assignment/AssignmentSubform.dart';
import 'package:falcon_net/Utility/ErrorFormatting.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Database/Unit.dart';
import '../../../../../Model/Database/User.dart';
import '../../../../../Model/Store/Endpoints.dart';
import '../../../../Components/PaddedColumn.dart';

class AssignmentForm extends StatefulWidget {
  final User assignee;
  final List<String> owner;
  final List<Unit> units;
  final void Function(List<String>, String)? onSubmit;
  final void Function()? onCancel;

  AssignmentForm({
    super.key,
    required this.assignee,
    required this.owner,
    required this.units,
    this.onSubmit,
    this.onCancel
  }) : assert(owner.isNotEmpty);

  @override
  State<StatefulWidget> createState() => AssignmentFormState();
}

class AssignmentFormState extends State<AssignmentForm> {
  late List<String> units;
  late String assigned;

  @override
  void initState() {
    super.initState();
    units = widget.assignee.units.toList();
    assigned = widget.assignee.assigned_unit!;
  }
  
  void removeUnit(BuildContext context, String base, {ScaffoldMessengerState? messenger}) async {
    bool descends(String parent, String target) => widget.units
        .firstWhere((u) => u.name == parent)
        .sub_units.any((s) => s == target || descends(s, target));

    List<String> others = units
        .where((u) => !units.any(
            (p) => widget.units.firstWhere((o) => o.name == p).parent_units.toList().contains(u)
        ))
        .where((u) => u != base)
        .toList();

    var retained = units
        .where((u) => others.contains(u) || others.any((o) => descends(u, o)))
        .toList();

    setState(() => units = retained);
  }
  
  void addUnit(BuildContext context, String base, {ScaffoldMessengerState? messenger}) async {
    List<String> chain(String child) =>
        [
          ...widget.units.where((u) => u.sub_units.contains(child)).expand((e) => chain(e.name)),
          child
        ];


    var retained = units + chain(base).where((u) => !units.contains(u)).toList();

    setState(() => units = retained);
  }

  @override
  Widget build(BuildContext context) {
    List<String> bases = units
        .where((u) => !units.any(
            (p) => widget.units.firstWhere((o) => o.name == p).parent_units.toList().contains(u)
    )).toList();

    List<String> grandchildren(List<String> children) =>
        children.map((e) => widget.units.where((u) => u.name == e))
            .expand((s) => s
                .expand((u) => [...grandchildren(u.sub_units.toList()), u.name])
                .toList()
            ).toList();

    var assignable = grandchildren(widget.owner.toList()).toSet().toList();

    print(assignable);
    
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          Text(
            "Member Units",
            style: Theme.of(context).textTheme.titleMedium,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              ...bases.map(
                    (base) => InfoBar(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Text(base),
                    ),

                    Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          if (base != assigned) {
                            removeUnit(context, base, messenger: ScaffoldMessenger.of(context));
                          }
                          else {
                            showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: PaddedColumn(
                                      padding: EdgeInsets.all(10),
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          "Unable to Delete",
                                          style: Theme.of(context).textTheme.titleMedium,
                                        ),

                                        const Text(
                                            "In order to delete this unit, you must first re-assign the user to another unit"
                                                " and set that unit as his or her assigned unit."
                                        ),

                                        ElevatedButton(
                                            onPressed: () => Navigator.of(context).pop(),
                                            child: const Text("Acknowledge")
                                        )
                                      ],
                                    ),
                                  ),
                                )
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => AssignmentSubform(
                        assignable: assignable,
                        onSelect: (unit) => addUnit(context, unit, messenger: ScaffoldMessenger.of(context))
                    ),
                  ),
                  child: const Icon(Icons.add),
                ),
              ),

              const SizedBox(height: 30,),

              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Assigned Unit",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),

                      DropdownButton<String>(
                        value: assigned,
                        items: units
                            .map((e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e)
                        ))
                            .toList(),
                        onChanged: (change) => setState(() => assigned = change!),
                      ),
                    ],
                  )
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    widget.onSubmit?.call(units, assigned);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text("Done"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}