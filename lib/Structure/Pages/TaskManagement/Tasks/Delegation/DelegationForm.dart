import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Delegation/RoleSubform.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Database/Delegate.dart';
import '../../../../../Model/Database/TimedRole.dart';

class DelegationForm extends StatefulWidget {
  final Delegate delegate;
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
                  padding: EdgeInsets.all(10),
                  child: RoleSubform(
                    value: role,
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
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () => setState(() {
                  roles.add(
                      TimedRole((b) => b
                          ..role = "sdo"
                          ..start = DateTime.now().toUtc()
                          ..end = DateTime.now().toUtc()
                      )
                  );
                }),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("Add Role"),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10),
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

                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text("Save"),
                      ),
                    ),
                  ),

                  Spacer(flex: 1,),

                  Expanded(
                    flex: 5,
                    child: ElevatedButton(
                      onPressed: widget.onCancel,
                      child: Padding(
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