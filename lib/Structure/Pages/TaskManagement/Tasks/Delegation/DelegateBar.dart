import 'package:falcon_net/Model/Database/UserDelegates.dart';
import 'package:falcon_net/Structure/Components/InfoBar.dart';
import 'package:flutter/material.dart';

///Displays a bar showing delegate name, current roles, and an assignment button
class DelegateBar extends StatelessWidget {
  final UserDelegates delegate;
  final void Function(UserDelegates) onAssign;

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
        roleDescription += "${timed.description(true)}, ";
      }
    }

    return InfoBar(
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

        IconButton(
          onPressed: () => onAssign(delegate),
          icon: const Icon(Icons.edit),
        ),
      ]
    );
  }
}