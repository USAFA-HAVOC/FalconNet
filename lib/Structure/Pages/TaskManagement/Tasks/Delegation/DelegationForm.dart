import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Delegation/RoleBar.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Database/Roles.dart';
import '../../../../../Model/Database/TimedRole.dart';
import '../../../../../Model/Database/User.dart';
import 'RoleSubform.dart';

class DelegationForm extends StatefulWidget {
  final User delegate;
  final List<TimedRole> applicable;
  final void Function(List<TimedRole>)? onSubmit;
  final void Function()? onCancel;

  DelegationForm(
      {super.key,
      required this.delegate,
      required this.applicable,
      this.onSubmit,
      this.onCancel})
      : assert(applicable.isNotEmpty);

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
              (role) => RoleBar(
                existing: role,
                applicable: widget.applicable,
                onRemove: () => setState(() {
                  roles.remove(role);
                }),
                onSubmit: (change) => setState(() {
                  var index = roles.indexOf(role);
                  roles.removeAt(index);
                  roles.insert(index, change);
                  widget.onSubmit?.call(roles);
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) => RoleSubform(
                          existing: TimedRole((b) => b
                            ..role = Roles.sdo.name
                            ..start = DateTime.now()
                            ..end = DateTime.now()),
                          onSubmit: (role) => setState(() {
                            roles.add(role);
                            widget.onSubmit?.call(roles);
                          }),
                          applicable: widget.applicable,
                        )),
                child: const Icon(Icons.add),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: widget.onCancel,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("Done"),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
