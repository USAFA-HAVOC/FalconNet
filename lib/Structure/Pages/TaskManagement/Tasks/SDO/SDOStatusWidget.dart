import 'package:flutter/material.dart';

import '../../../../../Model/Database/UnitData.dart';
import '../../../../Components/PageWidget.dart';

///Displays present status of SDO signing based on di object
///Displays a circular chart with counts for each di types
class SDOStatusWidget extends StatelessWidget {
  final UnitData di;

  const SDOStatusWidget({super.key, required this.di});

  @override
  Widget build(BuildContext context) {

    var unsignedCount = di.members.where((signee) => signee.status() == "unsigned").length;
    var signedCount = di.members.where((signee) => signee.status() == "signed").length;
    var outCount = di.members.where((signee) => signee.status() == "out").length;

    double percent;
    if (di.members.isEmpty) {
      percent = 0;
    }
    else {
      percent = (signedCount + outCount) / di.members.length;
    }
    return PageWidget(
      title: "Current Status",
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircularProgressIndicator(
                        strokeWidth: 10,
                        value: percent,
                      ),

                      Center(
                        child: Text(
                          "${(percent * 100).round().toString()}%",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            Spacer(flex: 1,),

            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Signed DI: ${signedCount.toString()}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),

                  Text(
                    "Signed-Out: ${outCount.toString()}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),

                  Text(
                    "Unsigned: ${unsignedCount.toString()}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}