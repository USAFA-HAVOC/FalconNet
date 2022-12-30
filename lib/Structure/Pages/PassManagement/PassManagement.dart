import 'package:flutter/material.dart';
import '../../Components/PassWidget.dart';
import 'AllotmentWidget.dart';

///Pass Management page which displays pass status and allotment information
class PassManagement extends StatelessWidget {
  const PassManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
          ),
        ),
      ],
    );
  }
}