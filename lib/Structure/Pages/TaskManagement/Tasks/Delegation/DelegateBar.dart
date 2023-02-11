import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Database/Delegate.dart';

///Displays a bar showing delegate name, current roles, and an assignment button
class DelegateBar extends StatelessWidget {
  final Delegate delegate;
  final void Function(Delegate) onAssign;

  const DelegateBar({super.key, required this.delegate, required this.onAssign});

  @override
  Widget build(BuildContext context) {

    //Builds a description of current role list, defaulting to "None"
    String roleDescription = "Current Roles: ";
    if (delegate.roles.isEmpty) {
      roleDescription += "None";
    }
    else {
      for (var timed in delegate.roles) {
        roleDescription += "${timed.role} (${describeDate(timed.start, true)} - ${describeDate(timed.end, true)}), ";
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Theme.of(context).dividerColor),
        ),

        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      delegate.name,
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.start,
                    ),

                    Text(roleDescription),
                  ],
                ),
              ),

              ElevatedButton(
                onPressed: () => onAssign(delegate),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("Assign",),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}