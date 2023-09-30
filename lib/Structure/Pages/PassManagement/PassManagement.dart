import 'package:falcon_net/Structure/Components/FNPage.dart';
import 'package:flutter/material.dart';
import '../../Components/PassWidget.dart';
import 'AllotmentWidget.dart';

///Pass Management page which displays pass status and allotment information
class PassManagement extends StatelessWidget {
  const PassManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return const FNPage(
        title: "Pass Management",
        children: [
          PassWidget(title: "Current Status",),

          AllotmentWidget(),
        ]
    );
  }
}