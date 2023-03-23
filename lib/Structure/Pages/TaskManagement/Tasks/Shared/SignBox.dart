import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import '../../../../Components/ConfirmationDialog.dart';
import '../../../../Components/InfoBar.dart';

///Box for displaying name, signing status, and signing button
class SignBox extends StatelessWidget {
  final String name;
  final String status;
  final void Function() onSign;

  final String statusDescription;

  const SignBox({super.key, required this.onSign, required this.name, required this.status}) :
      statusDescription = status == "signed" ? "Signed" : (status == "unsigned" ? "Unsigned" : "Out");

  @override
  Widget build(BuildContext context) {
    bool signable = status == "unsigned";
    return InfoBar(
      exteriorPadding: const EdgeInsets.symmetric(vertical: 3),
      interiorPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      children: [
        Expanded(
          flex: 3,
          child: Text(
            name,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),

        Expanded(
            flex: 2,
            child: Text(
              statusDescription,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            )
        ),

        Expanded(
            flex: 1,
            child: IconButton(
              onPressed: signable
                  ? () => showDialog(context: context, builder: (context) => ConfirmationDialog(
                      title: "Confirm Signing",
                      description: "Please confirm you would like to sign $name's dormitory inspection. "
                          "This action cannot be undone.",
                      onConfirm: onSign
                    ))
                  : null,
              icon: Icon(
                FontAwesome5.pen_nib,
                size: Theme.of(context).iconTheme.size ?? 24 * 0.8,
                color: Theme.of(context).iconTheme.color?.withAlpha(signable ? 255 : 60),
              ),
            )
        )
      ],
    );
  }
}