import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Shared/Signee.dart';
import 'package:flutter/material.dart';

import '../../../../Components/ConfirmationDialog.dart';

///Box for displaying name, signing status, and signing button
class SignBox extends StatelessWidget {
  final String name;
  final DIStatus status;
  final void Function() onSign;

  const SignBox({super.key, required this.onSign, required this.name, required this.status});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Text(
              name,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),

          if (status == DIStatus.unsigned) Expanded(
            flex: 4,
            child: ElevatedButton(
              onPressed: () => showDialog(context: context, builder: (context) => ConfirmationDialog(
                  title: "Confirm Signing",
                  description: "Please confirm you would like to sign ${name}'s dormitory inspection. "
                      "This action cannot be undone.",
                  onConfirm: onSign
              )),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text("Sign"),
              ),
            ),
          )

          else Expanded(
            flex: 4,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith((states) => Colors.grey),
              ),
              onPressed: null,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(status == DIStatus.signedDI ? "Signed" : "Signed-Out"),
              ),
            ),
          )
        ],
      ),
    );
  }
}