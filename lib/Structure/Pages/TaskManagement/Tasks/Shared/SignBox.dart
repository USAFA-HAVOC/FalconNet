import 'package:flutter/material.dart';

import '../../../../../Theme/NegativeButtonTheme.dart';
import '../../../../Components/ConfirmationDialog.dart';

///Box for displaying name, signing status, and signing button
class SignBox extends StatelessWidget {
  final String name;
  final String status;
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

          if (status == "unsigned") Expanded(
            flex: 4,
            child: ElevatedButton(
              onPressed: () => showDialog(context: context, builder: (context) => ConfirmationDialog(
                  title: "Confirm Signing",
                  description: "Please confirm you would like to sign ${name}'s dormitory inspection. "
                      "This action cannot be undone.",
                  onConfirm: onSign
              )),
              child: Text("Sign"),
            ),
          )

          else Expanded(
            flex: 4,
            child: ElevatedButton(
              style: Theme.of(context).extension<NegativeButtonTheme>()!.style,
              onPressed: null,
              child: Text(status == "signed" ? "Signed" : "Out"),
            ),
          )
        ],
      ),
    );
  }
}