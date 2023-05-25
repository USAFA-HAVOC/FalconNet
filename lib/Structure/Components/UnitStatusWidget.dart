import 'package:flutter/material.dart';

import '../../Model/Database/UnitData.dart';
import '../../Model/Database/UnitSummary.dart';
import '../../Model/Database/User.dart';
import '../../Model/Database/UserStatus.dart';
import '../../Model/Database/UserSummary.dart';
import 'FNPieChart.dart';
import 'PageWidget.dart';

///Displays present status of SDO signing based on di object
///Displays a circular chart with counts for each di types
class UnitStatusWidget extends StatelessWidget {
  final int unsigned;
  final int signed;
  final int out;
  final int leave;
  final String label;
  final bool here;

  UnitStatusWidget({super.key, required UnitData data, this.label = "Current Status"}) :
        here = false,
        unsigned = data.members.where((signee) => signee.status() == UserStatus.unsigned).length,
        signed = data.members.where((signee) => signee.status() == UserStatus.signed).length,
        out = data.members.where((signee) => signee.status() == UserStatus.out).length,
        leave = data.members.where((signee) => signee.status() == UserStatus.leave).length;

  UnitStatusWidget.fromList({super.key, required List<UnitSummary> units, this.label = "Current Status"}) :
        here = false,
        unsigned = units.map((u) => u.unsigned!).reduce((carry, value) => carry + value),
        signed = units.map((u) => u.signed!).reduce((carry, value) => carry + value),
        out = units.map((u) => u.out!).reduce((carry, value) => carry + value),
        leave = 0;

  UnitStatusWidget.fromUserSummaries({super.key, required List<UserSummary> users, this.label = "Current Status"}) :
        here = false,
        unsigned = users.where((user) => user.status() == UserStatus.unsigned).length,
        signed = users.where((user) => user.status() == UserStatus.signed).length,
        out = users.where((user) => user.status() == UserStatus.out).length,
        leave = users.where((user) => user.status() == UserStatus.leave).length;

  UnitStatusWidget.fromUsers({super.key, required List<User> users, this.label = "Current Status"}) :
        here = true,
        signed = 0,
        out = users.where((user) => user.accountability?.current_pass != null).length,
        leave = users.where((user) => user.accountability?.current_leave != null).length,
        unsigned = users.length
            - users.where((user) => user.accountability?.current_pass != null).length
            - users.where((user) => user.accountability?.current_leave != null).length;

  @override
  Widget build(BuildContext context) {
    return PageWidget(
        title: label,
        spacing: EdgeInsets.zero,
        padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
        children: [
          FNPieChart(
              values: [
                FNPieChartData(
                    label: "Signed",
                    value: signed.toDouble(),
                    color: Colors.blue,
                    primary: true
                ),

                FNPieChartData(
                    label: "Signed Out",
                    value: out.toDouble(),
                    color: Colors.blueGrey,
                    primary: true
                ),

                FNPieChartData(
                    label: here ? "Here" : "Unsigned",
                    value: unsigned.toDouble(),
                    color: Colors.grey,
                    primary: false
                ),

                if (leave != 0) FNPieChartData(
                    label: "Leave",
                    value: leave.toDouble(),
                    color: Colors.black,
                    primary: true,
                ),
              ]
          )
        ]
    );
  }
}