import 'package:falcon_net/Model/Database/UnitSummary.dart';
import 'package:falcon_net/Structure/Components/LoadingShimmer.dart';
import 'package:flutter/material.dart';

import '../../../../Components/PageWidget.dart';

class CWOCStatusWidget extends StatelessWidget {
  final List<UnitSummary> units;
  final String label;

  const CWOCStatusWidget({super.key, required this.units, required this.label});

  @override
  Widget build(BuildContext context) {
    if (units.isEmpty) {
      return PageWidget(
          title: label,
          children: [
            LoadingShimmer(height: 170,),
          ]
      );
    }

    int unsignedCount = 0;
    int signedCount = 0;
    int signedOutCount = 0;
    int total = 0;
    double percent;

    for (var unit in units) {
      signedCount += unit.signed;
      unsignedCount += unit.unsigned;
      signedOutCount += unit.out;
      total += unit.out + unit.signed + unit.unsigned;
    }

    if (total == 0) {
      percent = 0;
    }
    else {
      percent = (signedOutCount + signedCount) / total;
    }

    return PageWidget(
      title: label,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints.expand(height: 150),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
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
                      "Signed-Out: ${signedOutCount.toString()}",
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
          ),
        )
      ],
    );
  }
}