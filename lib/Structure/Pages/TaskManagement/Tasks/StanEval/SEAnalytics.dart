import 'package:falcon_net/Model/Database/UserSummary.dart';
import 'package:falcon_net/Structure/Components/InfoBar.dart';
import 'package:falcon_net/Structure/Components/FNPage.dart';
import 'package:falcon_net/Structure/Components/GraphWidget.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/StanEval/SEInfoDialog.dart';
import 'package:falcon_net/Utility/ListExtensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Database/UserGrades.dart';
import '../../../../Components/GradeAveragesWidget.dart';
import '../../../../Components/GradeBoard.dart';
import 'SEParameters.dart';

class SEAnalytics extends StatelessWidget {
  final SEParameters parameters;

  const SEAnalytics({super.key, required this.parameters});

  double calculateAverage(List<Grade> grades) =>
      grades.isNotEmpty ? (10 * grades.map((g) => g.score).reduce((v, e) => v + e) / grades.length).roundToDouble() / 10 : 0;

  double calculateReporting(List<Grade> grades) =>
      grades.isNotEmpty ? grades.length / parameters.grades.members.length : 0;

  List<Widget> buildStatisticBars(BuildContext context, {required void Function(String, Map<UserSummary, Grade>) onTap}) {
    if (!parameters.grades.grades.values.any(
            (gradeSet) => gradeSet.amis.isNotEmpty || gradeSet.samis.isNotEmpty || gradeSet.pais.isNotEmpty)
    ) {
      return [
        const Padding(
          padding: EdgeInsets.only(top: 10, bottom: 20),
          child: Text(
            "No Records for this Unit",
            textAlign: TextAlign.center,
          ),
        )
      ];
    }
    GradeBoard board = GradeBoard.fromUnitGrades(unit: parameters.grades);

    List<Widget> bars = <Widget>[];

    Widget buildGradeBar(Map<UserSummary, Grade> grades, String name) =>
        InfoBar(
          interiorPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          onTap: () => onTap(name, grades),
          children: [
            Expanded(
                flex: 3,
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.titleSmall,
                )
            ),

            Expanded(
                flex: 2,
                child: Text(
                  "${(100 * calculateReporting(grades.values.toList())).toStringAsFixed(0)}%\nReporting",
                  textAlign: TextAlign.center,
                )
            ),

            Expanded(
                flex: 2,
                child: Text(
                  "${calculateAverage(grades.values.toList()).toStringAsFixed(1)}\nAverage",
                  textAlign: TextAlign.center,
                )
            ),
          ],
        );


    for (var ami in board.amis.entries.toList().sortedKey((a) => a.key)) {
      if (ami.value.isNotEmpty) bars.add(buildGradeBar(ami.value, "AMI #${ami.key + 1}"));
    }

    for (var sami in board.samis.entries.toList().sortedKey((s) => s.key)) {
      if (sami.value.isNotEmpty) bars.add(buildGradeBar(sami.value, "SAMI #${sami.key + 1}"));
    }

    for (var pai in board.pais.entries.toList().sortedKey((p) => p.key)) {
      if (pai.value.isNotEmpty) bars.add(buildGradeBar(pai.value, "PAI #${pai.key + 1}"));
    }

    return bars;
  }

  @override
  Widget build(BuildContext context) {
    final GradeBoard board = GradeBoard.fromUnitGrades(unit: parameters.grades);
    return FNPage(
      title: "${parameters.name} Analytics",
      children: [
        GradeAveragesWidget.unit(unit: parameters.grades),

        GraphWidget(
          name: "AMI Trends",
          data: List<FlSpot>.generate(board.amis.length, (index) =>
              FlSpot(
                  (board.amis.keys.toList()[index] + 1).toDouble(),
                  calculateAverage(board.amis[board.amis.keys.toList()[index]]?.values.toList() ?? [])
              )
          ),
        ),

        PageWidget(
          title: "Records",
          children: buildStatisticBars(
            context,
            onTap: (name, grades) {
              showDialog(context: context, builder: (context) => SEInfoDialog(
                title: name,
                pairs: grades.map((key, value) => MapEntry(key.name, value.score.toString()))
              ));
            })
        )
      ]
    );
  }
}