import 'package:falcon_net/Model/Database/UserSummary.dart';
import 'package:falcon_net/Structure/Components/FNPage.dart';
import 'package:falcon_net/Structure/Components/GraphWidget.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/StanEval/SEInfoDialog.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Database/UserGrades.dart';
import 'SEAveragesWidget.dart';
import 'SEParameters.dart';

class SEAnalytics extends StatelessWidget {
  final SEParameters parameters;
  final List<Color> gradientColors = [
    Colors.blue,
    Colors.black,
  ];

  SEAnalytics({super.key, required this.parameters});

  double calculateAverage(List<Grade> grades) =>
      (10 * grades.map((g) => g.score).reduce((v, e) => v + e) / grades.length).roundToDouble() / 10;

  double calculateReporting(List<Grade> grades) =>
      grades.length / parameters.grades.members.length;

  List<Widget> buildStatisticBars(BuildContext context, {required void Function(String, Map<UserSummary, Grade>) onTap}) {
    GradeBoard board = GradeBoard.fromUnitGrades(unit: parameters.grades);

    List<Widget> bars = <Widget>[];

    Widget buildGradeBar(Map<UserSummary, Grade> grades, String name) =>
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Theme.of(context).dividerColor),
            ),

            child: InkWell(
              onTap: () => onTap(name, grades),
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
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
                  )
              ),
            )
          ),
        );
    var a = 1;
    for (var ami in board.amis) {
      bars.add(buildGradeBar(ami, "AMI #$a"));
      a++;
    }

    var s = 1;
    for (var sami in board.samis) {
      bars.add(buildGradeBar(sami, "SAMI #$s"));
      s++;
    }

    var p = 1;
    for (var pai in board.pais) {
      bars.add(buildGradeBar(pai, "PAI #$p"));
      p++;
    }

    return bars;
  }

  @override
  Widget build(BuildContext context) {
    final GradeBoard board = GradeBoard.fromUnitGrades(unit: parameters.grades);
    return FNPage(
      title: "${parameters.name} Analytics",
      children: [
        SEAveragesWidget(unit: parameters.grades),

        GraphWidget(
          name: "AMI Trends",
          data: List<FlSpot>.generate(board.amis.length, (index) =>
              FlSpot(
                  (index + 1).toDouble(),
                  calculateAverage(board.amis[index].values.toList())
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