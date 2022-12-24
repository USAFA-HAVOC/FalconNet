import 'package:flutter/material.dart';

import '../../Shared/PassWidget.dart';
import 'AllotmentWidget.dart';

class PassManagement extends StatelessWidget {
  const PassManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: false,
      shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
              "Pass Management",
              style: Theme.of(context).textTheme.titleLarge
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: PassWidget(title: "Current Status",),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: AllotmentWidget(),
        ),
      ],
    );
  }
}