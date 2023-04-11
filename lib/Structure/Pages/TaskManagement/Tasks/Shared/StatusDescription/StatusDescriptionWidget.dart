import 'package:flutter/material.dart';

import '../../../../../../Model/Database/User.dart';
import '../../../../../../Model/Database/UserStatus.dart';
import '../../../../../../Utility/TemporalFormatting.dart';
import 'LeaveDescriptionWidget.dart';
import 'PassDescriptionWidget.dart';

class StatusDescriptionWidget extends StatelessWidget {
  final User user;

  const StatusDescriptionWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    switch (user.status()) {
      case UserStatus.out:
        return PassDescriptionWidget(pass: user.accountability!.current_pass!,);

      case UserStatus.leave:
        return LeaveDescriptionWidget(leave: user.accountability!.current_leave!,);

      case UserStatus.unsigned:
        return const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "User has not signed DI and is neither signed out nor on leave.",
            textAlign: TextAlign.start,
          ),
        );

      case UserStatus.signed:
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            "DI signed by ${user.accountability!.di_signed_name} at ${describeTime(TimeOfDay.fromDateTime(user.accountability!.di_last_signed!))}",
            textAlign: TextAlign.start,
          ),
        );
    }
  }
}