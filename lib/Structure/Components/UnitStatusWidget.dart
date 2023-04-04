import 'package:flutter/material.dart';

import '../../Model/Database/UnitData.dart';
import 'FNPieChart.dart';
import 'PageWidget.dart';

///Displays present status of SDO signing based on di object
///Displays a circular chart with counts for each di types
class UnitStatusWidget extends StatelessWidget {
  final UnitData data;

  const UnitStatusWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var unsignedCount = data.members.where((signee) => signee.status() == "unsigned").length;
    var signedCount = data.members.where((signee) => signee.status() == "signed").length;
    var outCount = data.members.where((signee) => signee.status() == "out").length;
    var leaveCount = data.members.where((signee) => signee.status() == "leave").length;

    return PageWidget(
        title: "Current Status",
        spacing: EdgeInsets.zero,
        children: [
          FNPieChart(
              values: [
                FNPieChartData(
                    label: "Signed",
                    value: signedCount.toDouble(),
                    color: Colors.blue,
                    primary: true
                ),

                FNPieChartData(
                    label: "Signed Out",
                    value: outCount.toDouble(),
                    color: Colors.blueGrey,
                    primary: true
                ),

                FNPieChartData(
                    label: "Unsigned",
                    value: unsignedCount.toDouble(),
                    color: Colors.grey,
                    primary: false
                ),

                FNPieChartData(
                    label: "Leave",
                    value: leaveCount.toDouble(),
                    color: Colors.black,
                    primary: true,
                ),
              ]
          )
        ]
    );
  }
}