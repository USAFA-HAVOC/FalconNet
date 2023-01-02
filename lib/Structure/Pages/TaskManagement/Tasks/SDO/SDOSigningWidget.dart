import 'package:flutter/material.dart';

import '../../../../../Model/Data/DIStatus.dart';
import '../../../../Components/PageWidget.dart';
import 'SignBox.dart';

class SDOSigningWidget extends StatelessWidget {
  final Map<String, DIStatus> di;
  final void Function(String) onSign;

  const SDOSigningWidget({super.key, required this.di, required this.onSign});

  @override
  Widget build(BuildContext context) {
    return PageWidget(
        title: "Inspections",
        children: [
          ListView(
            primary: false,
            shrinkWrap: true,
            children: di.map(
              (name, value) => MapEntry(
                name,
                SignBox(
                  name: name,
                  status: value,
                  onSign: () => onSign(name),
                ),
              )
            ).values.toList(),
          )
        ]
    );
  }
}