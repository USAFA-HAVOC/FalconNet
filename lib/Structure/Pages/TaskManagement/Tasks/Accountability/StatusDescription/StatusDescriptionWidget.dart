import 'package:flutter/material.dart';

import '../../../../../../Model/Database/User.dart';
import 'LeaveDescriptionWidget.dart';

class StatusDescriptionWidget extends StatelessWidget {
  final User user;

  const StatusDescriptionWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    if (user.accountability?.current_pass != null) {
      return const Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "User is currently Signed-Out",
          textAlign: TextAlign.start,
        ),
      );
    }
    else if (user.accountability?.current_leave != null) {
      return LeaveDescriptionWidget(leave: user.accountability!.current_leave!,);
    }
    else {
      return const Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "User is neither on leave nor has an open pass.",
          textAlign: TextAlign.start,
        ),
      );
    }
  }
}