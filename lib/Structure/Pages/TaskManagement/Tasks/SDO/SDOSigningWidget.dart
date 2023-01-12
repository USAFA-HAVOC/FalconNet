import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../Model/Data/DIStatus.dart';
import '../../../../Components/PageWidget.dart';
import 'SignBox.dart';

///Page Widget displaying all squadron names and allowing SDO to sign di
class SDOSigningWidget extends StatelessWidget {
  final Map<String, DIStatus>? di;
  final void Function(String) onSign;

  const SDOSigningWidget({super.key, required this.di, required this.onSign});

  @override
  Widget build(BuildContext context) {
    if (di == null) {
      return PageWidget(
          title: "Inspections",
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

    return PageWidget(
        title: "Inspections",
        children: [
          ListView(
            primary: false,
            shrinkWrap: true,
            children: di!.map(
              (name, value) => MapEntry(
                name,
                SignBox(
                  name: name,
                  status: value,
                  onSign: () => onSign(name),
                ),
              )
            ).values.toList(),
          ),
        ]
    );
  }
}