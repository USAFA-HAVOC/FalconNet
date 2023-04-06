import 'package:falcon_net/Model/Database/CadetLeave.dart';
import 'package:flutter/material.dart';

import '../../../../Components/LeaveDescription.dart';

class LeaveDescriptionWidget extends StatelessWidget {
  final CadetLeave leave;

  const LeaveDescriptionWidget({super.key, required this.leave});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          LeaveDescription(leave: leave,),
        ],
      )
    );
  }
}