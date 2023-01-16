import 'package:falcon_net/Structure/Components/DateFormField.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Delegation/DelegationData.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Data/Role.dart';
import "../../../../../Utility/InputValidation.dart";

class RoleSubform extends StatelessWidget {
  final TimedRole value;
  final List<TimedRole> applicable;
  final void Function(TimedRole) onChanged;
  final void Function() onRemove;

  RoleSubform({
    super.key,
    required this.value,
    required this.applicable,
    required this.onChanged,
    required this.onRemove,
  }) : assert(applicable.isNotEmpty);

  @override
  Widget build(BuildContext context) {

    //If role permissions extend beyond owners, role is uneditable
    var editable = applicable.any((timed) {
      if (timed.role.type == value.role.type) {
        return timed.role.level.rawValue > value.role.level.rawValue;
      }
      return false;
    });

    if (editable) {
      editable = applicable.earliest(role: value.role.type, level: value.role.level).compareTo(value.start) != 1 &&
          applicable.latest(role: value.role.type, level: value.role.level).compareTo(value.end) != -1;
    }

    if (!editable) {
      return DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).dividerColor, width: 5),
            borderRadius: BorderRadius.circular(10),
          ),

          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "${value.role.type.description} Role Uneditable",
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
            DropdownButtonFormField<RoleType>(
              value: value.role.type,
              decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.bodyLarge,
                  labelText: "Role"
              ),
              items: applicable.map<DropdownMenuItem<RoleType>?>((possible) {
                if (possible.role.level.rawValue > 0) {
                  return DropdownMenuItem<RoleType>(
                    value: possible.role.type,
                    child: Text(possible.role.type.description),
                  );
                }
                return null;
              })
                  .where((item) => item != null)
                  .map((e) => e!)
                  .toList(),
              onChanged: (selection) => onChanged(TimedRole(
                role: Role(
                  type: selection!,
                  level: applicable.highest(type: selection, baseline: value.role.level)
                ),
                start: applicable.constrain(value.start, type: selection, level: value.role.level, start: true),
                end: applicable.constrain(value.end, type: selection, level: value.role.level, start: false),
              )),
            ),

            SizedBox(height: 20,),

            DropdownButtonFormField<RoleLevel>(
              value: value.role.level,
              decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.bodyLarge,
                  labelText: "Level"
              ),
              items: List<DropdownMenuItem<RoleLevel>>.generate(
                  applicable.highest(type: value.role.type).rawValue + 1,
                  (index) => DropdownMenuItem(
                    value: RoleLevelInfo.fromValue(index),
                    child: Text(RoleLevelInfo.fromValue(index).description),
                  )
              ),
              onChanged: (selection) => onChanged(TimedRole(
                role: Role(
                  type: value.role.type,
                  level: selection!
                ),
                start: applicable.constrain(value.start, type: value.role.type, level: selection, start: true),
                end: applicable.constrain(value.end, type: value.role.type, level: selection, start: false),
              )),
            ),

            SizedBox(height: 20,),

            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: DateFormField(
                    validator: InputValidation.date(),
                    value: describeDate(value.start),
                    firstDate: applicable.earliest(role: value.role.type, level: value.role.level, last: value.end),
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
                    validator: InputValidation.date(),
                    value: describeDate(value.end),
                    firstDate: value.start,
                    lastDate: applicable.latest(role: value.role.type, level: value.role.level, first: value.start),
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