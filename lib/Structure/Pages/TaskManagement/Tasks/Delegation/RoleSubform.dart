import 'package:falcon_net/Structure/Components/DateFormField.dart';
import 'package:falcon_net/Theme/NegativeButtonTheme.dart';
import 'package:falcon_net/Utility/ListExtensions.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Model/Database/Role.dart';
import '../../../../../Model/Database/TimedRole.dart';
import '../../../../../Model/Database/Unit.dart';
import "../../../../../Utility/InputValidation.dart";

class RoleSubform extends StatefulWidget {
  final TimedRole initialValue;
  final List<TimedRole> applicable;
  final List<Unit> units;
  final void Function(TimedRole) onSubmit;
  final void Function()? onCancel;

  RoleSubform({
    super.key,
    required TimedRole existing,
    required this.onSubmit,
    required this.applicable,
    required this.units,
    this.onCancel
  }) :  assert(applicable.isNotEmpty),
        initialValue = existing.toLocal();

  @override
  State<StatefulWidget> createState() => RoleSubformState();
}

class RoleSubformState extends State<RoleSubform> {
  late TimedRole value;
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  bool requiresUnit(String? role) =>
      <String>[
        Roles.unit_admin.name,
        Roles.accountability_rep.name,
        Roles.sdo.name
      ].contains(role ?? "");

  @override
  Widget build(BuildContext context) {

    var highest = widget.applicable
        .reduce((value, role) => value.isGreaterThan(role) ? value : role);

    //If role permissions extend beyond owners, role is uneditable
    var editable = highest.delegable().any((r) => r == value.name);

    if (!editable) {
      return Dialog(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).dividerColor, width: 5),
                borderRadius: BorderRadius.circular(10),
              ),

              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "${value.name} Role Uneditable",
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
              )
          ),
        ),
      );
    }

    var scope = value.delegationScope(widget.applicable);

    var earliest = scope.key;
    var latest = scope.value;

    List<String> grandchildren(List<String> children) =>
        children.map((e) => widget.units.where((u) => u.name == e))
          .expand((s) => s
            .expand((u) => [...grandchildren(u.sub_units.toList()), u.name])
            .toList()
          ).toList();

    var ceiling = widget.units.firstWhere((u) => u.parent_units.isEmpty).name;

    var assignable = grandchildren(
        widget.applicable.where((r) => r.isAdmin())
            .map((r) => r.name == Roles.unit_admin.name
                ? r.unit!
                : ceiling
            )
            .toList()
    )
        .toSet()
        .toList()
        .sorted((a, b) => a.compareTo(b));

    return Dialog(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<String>(
                value: value.name,

                decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.bodyLarge,
                    labelText: "Role"
                ),

                items: highest.delegable().map<DropdownMenuItem<String>?>((possible) {
                  Roles parsed = RoleNames.parseDirect(possible);
                  return DropdownMenuItem<String>(
                    value: parsed.name,
                    child: Text(parsed.description()),
                  );
                })
                    .where((item) => item != null)
                    .map((e) => e!)
                    .toList(),

                onChanged: !(!(earliest == null && latest == null) && (value.start == null || value.end == null)) ? (selection) {
                  setState(() {
                    value = TimedRole((b) => b
                      ..name = selection
                      ..unit = requiresUnit(selection)
                          ? assignable.first
                          : null
                      ..start = value.start
                      ..end = value.end
                    ).toUtc();
                  });
                } : null,
              ),

              const SizedBox(height: 20,),

              (requiresUnit(value.name))
                  ? DropdownButtonFormField<String>(
                        value: assignable.contains(value.unit!) ? value.unit! : ceiling,
                        items: assignable.map((u) => DropdownMenuItem<String>(
                            value: u,
                            child: Text(u)
                        )).toList(),
                        onChanged: (change) => setState(() {
                          value = TimedRole((b) => b
                            ..name = value.name
                            ..unit = change
                            ..start = value.start
                            ..end = value.end
                          ).toUtc();
                        })
                    )
                  : const SizedBox(),

              !(!(earliest == null && latest == null) && (value.start == null || value.end == null))
                  ? Row(
                      children: [
                        Text(
                          "Timed",
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.left,
                        ),
                        Checkbox(value: value.start != null || !(earliest == null && latest == null), onChanged: (earliest == null && latest == null) ? (change) {
                          change ??= false;
                          if (change) {
                            setState(() {
                              value = TimedRole((b) => b
                                ..name = value.name
                                ..unit = value.unit
                                ..start = DateTime.now().subtract(const Duration(days: 1))
                                ..end = DateTime.now().add(const Duration(days: 7))
                              ).toUtc();
                            });
                          } else {
                            setState(() {
                              value = TimedRole((b) => b
                                ..name = value.name
                                ..unit = value.unit
                                ..start = null
                                ..end = null
                              ).toUtc();
                            });
                          }
                        } : null)
                      ],
                    )
                  : const SizedBox(),

              ((value.start != null && value.end != null) || !(earliest == null && latest == null)) && !(!(earliest == null && latest == null) && (value.start == null || value.end == null))
                  ? Row(
                      children: [
                        Expanded(
                            flex: 5,
                            child: DateFormField(
                              label: "Start",
                              validator: (content) {
                                var error = InputValidation.date()(content);
                                if (error == null) {
                                  var parsed = parseDate(content!);
                                  if (parsed.isAfter(value.end!)) {
                                    return "Start date is after end date";
                                  }
                                }
                                return error;
                              },
                              value: (value.start ?? earliest) == null ? null : describeDate(value.start ?? earliest!),
                              onChanged: (change) => setState(() {
                                value = TimedRole((b) => b
                                  ..name = value.name
                                  ..unit = value.unit
                                  ..start = parseDate(change)
                                  ..end = value.end
                                ).toUtc();
                              }),
                            )
                        ),

                        const Spacer(flex: 1,),

                        Expanded(
                            flex: 5,
                            child: DateFormField(
                              label: "End",
                              validator: InputValidation.date(),
                              value: (value.end ?? latest) == null ? null : describeDate(value.end ?? latest!),
                              onChanged: (change) => setState(() {
                                value = TimedRole((b) => b
                                  ..name = value.name
                                  ..unit = value.unit
                                  ..start = value.start
                                  ..end = parseDate(change)
                                ).toUtc();
                              }),
                            )
                        ),
                      ],
                    )

                  : const SizedBox(),

              const SizedBox(height: 20,),

              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.pop();
                            widget.onSubmit(value);
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text("Save"),
                        )
                    ),
                  ),

                  const Spacer(flex: 1,),

                  Expanded(
                    flex: 4,
                    child: ElevatedButton(
                        style: Theme.of(context).extension<NegativeButtonTheme>()!.style,
                        onPressed: () {
                          context.pop();
                          widget.onCancel?.call();
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text("Cancel"),
                        )
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}