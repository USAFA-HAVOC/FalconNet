import 'package:falcon_net/Structure/Components/DateFormField.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Delegation/DelegationData.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';

import "../../../../../Utility/InputValidation.dart";

class RoleSubform extends StatelessWidget {
  final TimedRole value;
  final List<TimedRole> applicable;
  final void Function(TimedRole) onChanged;
  final void Function() onRemove;

  RoleSubform({
    super.key,
    required this.value,
    required this.onChanged,
    required this.onRemove,
    required this.applicable
  }) : assert(applicable.isNotEmpty);

  @override
  Widget build(BuildContext context) {

    //If role permissions extend beyond owners, role is uneditable
    var editable = applicable.any((given) {
      return given.role.isGreaterThan(value.role);
    });

    print(applicable.map((e) => e.role).toList().highest!);

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
            DropdownButtonFormField<Role>(
              value: value.role,
              decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.bodyLarge,
                  labelText: "Role"
              ),
              items: applicable.map((e) => e.role).toList().highest!.delegable.map<DropdownMenuItem<Role>?>((possible) {
                return DropdownMenuItem<Role>(
                  value: possible,
                  child: Text(possible.description),
                );
              })
                  .where((item) => item != null)
                  .map((e) => e!)
                  .toList(),
              onChanged: (selection) {
                onChanged(TimedRole(
                  role: selection!,
                  start: value.start,
                  end: value.end,
                ));
              },
            ),

            SizedBox(height: 20,),

            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: DateFormField(
                    label: "Start",
                    validator: InputValidation.date(),
                    value: describeDate(value.start),
                    firstDate: applicable.earliest(role: value.role, last: value.end),
                    lastDate: value.end,
                    onChanged: (change) => onChanged(TimedRole(
                      role: value.role,
                      start: parseDate(change),
                      end: value.end,
                    )),
                  )
                ),

                Spacer(flex: 1,),

                Expanded(
                  flex: 5,
                  child: DateFormField(
                    label: "End",
                    validator: InputValidation.date(),
                    value: describeDate(value.end),
                    firstDate: value.start,
                    lastDate: applicable.latest(role: value.role, first: value.start),
                    onChanged: (change) => onChanged(TimedRole(
                      role: value.role,
                      start: value.start,
                      end: parseDate(change),
                    )),
                  )
                ),
              ],
            ),

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