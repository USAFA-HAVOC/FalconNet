import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Delegation/RoleSubform.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Database/Roles.dart';
import '../../../../../Model/Database/TimedRole.dart';
import '../../../../../Model/Database/User.dart';
import '../../../../../Theme/NegativeButtonTheme.dart';

class DelegationForm extends StatefulWidget {
  final User delegate;
  final List<TimedRole> applicable;
  final void Function(List<TimedRole>)? onSubmit;
  final void Function()? onCancel;

  DelegationForm({
    super.key,
    required this.delegate,
    required this.applicable,
    this.onSubmit,
    this.onCancel
  }) : assert(applicable.isNotEmpty);

  @override
  State<StatefulWidget> createState() => DelegationFormState();
}

class DelegationFormState extends State<DelegationForm> {
  late List<TimedRole> roles;

  @override
  void initState() {
    super.initState();
    roles = widget.delegate.roles.toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            ...roles.map(
                (role) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: RoleSubform(
                    existing: role,
                    applicable: widget.applicable,
                    onRemove: () => setState(() {
                      roles.remove(role);
                    }),
                    onChanged: (change) => setState(() {
                      var index = roles.indexOf(role);
                      roles.removeAt(index);
                      roles.insert(index, change);
                    }),
                  ),
                )
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () => setState(() {
                  roles.add(
                      TimedRole((b) => b
                          ..role = Roles.sdo.name
                          ..start = DateTime.now()
                          ..end = DateTime.now()
                      )
                  );
                }),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("Add Role"),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: ElevatedButton(
                      onPressed: () {
                        if (widget.onSubmit != null) {
                          widget.onSubmit!(roles);
                        }
                      },

                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text("Save"),
                      ),
                    ),
                  ),

                  const Spacer(flex: 1,),

                  Expanded(
                    flex: 5,
                    child: ElevatedButton(
                      style: Theme.of(context).extension<NegativeButtonTheme>()!.style,
                      onPressed: widget.onCancel,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text("Cancel"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}