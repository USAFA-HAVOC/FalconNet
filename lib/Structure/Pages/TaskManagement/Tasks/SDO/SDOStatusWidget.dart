import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../Model/Data/DIStatus.dart';
import '../../../../Components/PageWidget.dart';

///Displays present status of SDO signing based on di object
///Displays a circular chart with counts for each di types
class SDOStatusWidget extends StatelessWidget {
  final Map<String, DIStatus>? di;

  const SDOStatusWidget({super.key, required this.di});

  @override
  Widget build(BuildContext context) {
    if (di == null) {
      return PageWidget(
          title: "Current Status",
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: SizedBox(width: double.infinity, height: 100,),
              ),
            )
          ]
      );
    }

    var unsignedCount = di!.values.where((status) => status == DIStatus.unsigned).length;
    var signedCount = di!.values.where((status) => status == DIStatus.signedDI).length;
    var signedOutCount = di!.values.where((status) => status == DIStatus.signedOut).length;

    double percent;
    if (di!.length == 0) {
      percent = 0;
    }
    else {
      percent = (signedCount + signedOutCount) / di!.length;
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
        )
      ],
    );
  }
}