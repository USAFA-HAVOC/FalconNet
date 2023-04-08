import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import '../../../../../Model/Database/User.dart';
import '../../../../../Model/Database/UserStatus.dart';
import '../../../../Components/ConfirmationDialog.dart';
import '../../../../Components/InfoBar.dart';

///Box for displaying name, signing status, and signing button
class SignBox extends StatelessWidget {
  final User user;
  final void Function() onSign;

  const SignBox({super.key, required this.onSign, required this.user});

  @override
  Widget build(BuildContext context) {
    bool signable = user.status() == UserStatus.unsigned;

    return InfoBar(
      exteriorPadding: const EdgeInsets.symmetric(vertical: 3),
      interiorPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      children: [
        Expanded(
          flex: 3,
          child: Text(
            user.personal_info.full_name,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),

        Expanded(
            flex: 2,
            child: Text(
              user.displayStatus(),
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
                      description: "Please confirm you would like to sign "
                          "${user.personal_info.full_name}'s dormitory inspection. "
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