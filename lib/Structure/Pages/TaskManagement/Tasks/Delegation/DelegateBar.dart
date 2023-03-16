import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Database/Roles.dart';
import '../../../../../Model/Database/User.dart';

///Displays a bar showing delegate name, current roles, and an assignment button
class DelegateBar extends StatelessWidget {
  final User delegate;
  final void Function(User) onAssign;

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
        if (timed.start != null && timed.end != null) {
          roleDescription +=
          "${RoleNames.parseDirect(timed.role).description()} (${describeDate(
              timed.start ?? DateTime.now(), true)} - ${describeDate(
              timed.end ?? DateTime.now(), true)}), ";
        } else {
          roleDescription +=
          "${RoleNames.parseDirect(timed.role).description()} (Indefinite), ";
        }
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
                      delegate.personal_info.full_name,
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.start,
                    ),

                    Text(roleDescription),
                  ],
                ),
              ),

              IconButton(
                onPressed: () => onAssign(delegate),
                icon: const Icon(Icons.edit),
              ),
            ],
          )
        ),
      ),
    );
  }
}