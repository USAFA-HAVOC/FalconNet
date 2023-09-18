import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import '../../../../../Model/Database/UserStatus.dart';
import '../../../../../Model/Database/UserSummary.dart';
import '../../../../Components/ConfirmationDialog.dart';
import '../../../../Components/InfoBar.dart';

///Box for displaying name, signing status, and signing button
class SignBox extends StatelessWidget {
  final UserSummary user;
  final String? event;
  final void Function() onSign;

  const SignBox({super.key, required this.onSign, required this.user, this.event});

  @override
  Widget build(BuildContext context) {
    bool signable = user.status.status == UserStatus.unsigned.name;

    return InfoBar(
      exteriorPadding: const EdgeInsets.symmetric(vertical: 3),
      interiorPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                user.name,
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.left,
              ),

              Text(
                user.phone_number == null ? "Missing Phone #" : (user.phone_number!.trim().isEmpty ? "Missing Phone #" : user.phone_number!),
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          )
        ),

        Expanded(
            flex: 2,
            child: (![UserStatus.out_returning.name, UserStatus.out.name, UserStatus.overdue.name].contains(user.status.status))
              ? Text(
                  UserStatusNames.parse(user.status.status).display(),
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      UserStatusNames.parse(user.status.status).display(),
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                        color: Colors.red
                      ),
                      textAlign: TextAlign.center,
                    ),

                    Text(
                      "${describeDate(user.status.returning!)} ${describeTime(TimeOfDay.fromDateTime(user.status.returning!))}",
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    )
                  ],
                )
        ),

        Expanded(
            flex: 1,
            child: IconButton(
              onPressed: signable
                  ? () => showDialog(context: context, builder: (context) => ConfirmationDialog(
                      title: "Confirm Signing",
                      description: "Please confirm you would like to sign "
                          "${user.name}'s dormitory inspection. "
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