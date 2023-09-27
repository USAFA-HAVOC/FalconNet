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
  final int returning;
  final int overdue;
  final int excused;
  final String label;
  final bool here;

  UnitStatusWidget({super.key, required UnitData data, this.label = "Current Status", String? event}) :
        here = false,
        unsigned = data.members.where((signee) => signee.status.status == UserStatus.unsigned.name).length,
        signed = data.members.where((signee) => signee.status.status == UserStatus.signed.name).length,
        out = data.members.where((signee) => signee.status.status == UserStatus.out.name).length,
        leave = data.members.where((signee) => signee.status.status == UserStatus.leave.name).length,
        returning = data.members.where((signee) => signee.status.status == UserStatus.out_returning.name).length,
        overdue = data.members.where((signee) => signee.status.status == UserStatus.overdue.name).length,
        excused = data.members.where((signee) => signee.status.status == UserStatus.excused.name).length;

  UnitStatusWidget.fromList({super.key, required List<UnitSummary> units, this.label = "Current Status"}) :
        here = false,
        unsigned = units.map((u) => u.unsigned!).reduce((carry, value) => carry + value),
        signed = units.map((u) => u.signed!).reduce((carry, value) => carry + value),
        out = units.map((u) => u.out!).reduce((carry, value) => carry + value),
        leave = units.map((u) => u.leave!).reduce((carry, value) => carry + value),
        returning = units.map((u) => u.out_returning!).reduce((carry, value) => carry + value),
        overdue = units.map((u) => u.overdue!).reduce((carry, value) => carry + value),
        excused = units.map((u) => u.excused!).reduce((carry, value) => carry + value);

  UnitStatusWidget.fromUserSummaries({super.key, required List<UserSummary> users, this.label = "Current Status"}) :
        here = false,
        unsigned = users.where((user) => user.status.status == UserStatus.unsigned.name).length,
        signed = users.where((user) => user.status.status == UserStatus.signed.name).length,
        out = users.where((user) => user.status.status == UserStatus.out.name).length,
        leave = users.where((user) => user.status.status == UserStatus.leave.name).length,
        overdue = users.where((user) => user.status.status == UserStatus.overdue.name).length,
        returning = users.where((user) => user.status.status == UserStatus.out_returning.name).length,
        excused = users.where((user) => user.status.status == UserStatus.excused.name).length;

  UnitStatusWidget.fromUsers({super.key, required List<User> users, this.label = "Current Status"}) :
        here = true,
        signed = 0,
        returning = 0,
        overdue = 0,
        excused = 0,
        out = users.where((user) => user.accountability?.current_pass != null).length,
        leave = users.where((user) => user.accountability?.current_leave != null).length,
        unsigned = users.length
            - users.where((user) => user.accountability?.current_pass != null).length
            - users.where((user) => user.accountability?.current_leave != null).length;

  @override
  Widget build(BuildContext context) {
    return PageWidget(
        title: label,
        hasShadow: false,
        spacing: EdgeInsets.zero,
        padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
        children: [
          FNPieChart(
              values: [
                FNPieChartData(
                    label: "Signed",
                    value: signed.toDouble(),
                    color: Colors.blue[600]!,
                    primary: true
                ),

                if (excused != 0) FNPieChartData(
                    label: "Excused",
                    value: excused.toDouble(),
                    color: Colors.blue[300]!,
                    primary: true
                ),

                FNPieChartData(
                    label: "Signed Out",
                    value: out.toDouble(),
                    color: Colors.blueGrey,
                    primary: true
                ),

                if (returning != 0) FNPieChartData(
                    label: "Returning",
                    value: returning.toDouble(),
                    color: Colors.blueGrey[800]!,
                    primary: false
                ),

                FNPieChartData(
                    label: here ? "Here" : "Unsigned",
                    value: unsigned.toDouble(),
                    color: Colors.grey,
                    primary: false
                ),

                if (overdue != 0) FNPieChartData(
                    label: "Overdue",
                    value: overdue.toDouble(),
                    color: Colors.red,
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