import 'package:falcon_net/Structure/Components/DateFormField.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Database/Roles.dart';
import '../../../../../Model/Database/TimedRole.dart';
import "../../../../../Utility/InputValidation.dart";

class RoleSubform extends StatelessWidget {
  final TimedRole value;
  final List<TimedRole> applicable;
  final void Function(TimedRole) onChanged;
  final void Function() onRemove;

  RoleSubform({
    super.key,
    required TimedRole existing,
    required this.onChanged,
    required this.onRemove,
    required this.applicable
  }) :
        assert(applicable.isNotEmpty),
        value = existing.toLocal();

  @override
  Widget build(BuildContext context) {

    var highest = applicable.reduce((value, role) => value.isGreaterThan(role) ? value : role);

    //If role permissions extend beyond owners, role is uneditable
    var editable = highest.delegable().any((r) => r == value.role);

    if (!editable) {
      return DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).dividerColor, width: 5),
            borderRadius: BorderRadius.circular(10),
          ),

          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "${value.role} Role Uneditable",
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
          )
      );
    }

    var earliest = (applicable.firstWhere((r) => r.isGreaterThan(value)).start ?? DateTime(2000));
    var latest = (applicable.firstWhere((r) => r.isGreaterThan(value)).end ?? DateTime(3000));

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor, width: 5),
        borderRadius: BorderRadius.circular(10),
      ),

      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              value: value.role,

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

              onChanged: (selection) {
                onChanged(TimedRole((b) => b
                  ..role = selection!
                  ..start = value.start
                  ..end = value.end
                ).toUtc());
              },
            ),

            SizedBox(height: 20,),

            Row(
              children: [
                Text(
                  "Timed",
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.left,
                ),
                Checkbox(value: value.start != null, onChanged: (change) {
                  change ??= false;
                  if (change) {
                    onChanged(TimedRole((b) => b
                      ..role = value.role
                      ..start = DateTime.now().subtract(const Duration(days: 1))
                      ..end = DateTime.now().add(const Duration(days: 7))
                    ).toUtc());
                  } else {
                    onChanged(TimedRole((b) => b
                      ..role = value.role
                      ..start = null
                      ..end = null
                    ).toUtc());
                  }
                })
              ],
            ),

            value.start != null && value.end != null ?
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: DateFormField(
                    label: "Start",
                    validator: InputValidation.date(),
                    value: describeDate(value.start ?? earliest),
                    firstDate: earliest,
                    lastDate: value.end,
                    onChanged: (change) => onChanged(TimedRole((b) => b
                      ..role = value.role
                      ..start = parseDate(change)
                      ..end = value.end
                    ).toUtc()),
                  )
                ),

                Spacer(flex: 1,),

                Expanded(
                  flex: 5,
                  child: DateFormField(
                    label: "End",
                    validator: InputValidation.date(),
                    value: describeDate(value.end ?? latest),
                    firstDate: value.start,
                    lastDate: latest,
                    onChanged: (change) => onChanged(TimedRole((b) => b
                      ..role = value.role
                      ..start = value.start
                      ..end = parseDate(change)
                    ).toUtc()),
                  )
                ),
              ],
            ) : SizedBox(),

            SizedBox(height: 20,),

            ElevatedButton(
                onPressed: onRemove,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("Remove"),
                )
            ),
          ],
        ),
      )
    );
  }
}