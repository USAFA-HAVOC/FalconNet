import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/UserGrades.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Structure/Components/FNPage.dart';
import 'package:falcon_net/Structure/Components/GradeAveragesWidget.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Pages/Grades/GradePanel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../Components/GraphWidget.dart';
import '../../Components/ViewModel.dart';

///Grades page displays sami and ami information in extension panel lists
class Grades extends StatelessWidget {
  const Grades({super.key});

  String calculateAverage(List<Grade> grades) {
    if (grades.isEmpty) {
      return "NA";
    }
    var sum = grades.map((grade) => grade.score).reduce((one, two) => one + two);
    return (sum / grades.length).toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalState, ViewModel<UserGrades>>(
      converter: (store) => ViewModel<UserGrades>(store: store, content: store.state.grades),
      builder: (context, model) => FNPage(
        title: "Grades",
        children: [
            GradeAveragesWidget.user(user: model.content),

            if (model.content.amis.isNotEmpty) GraphWidget(
              name: "AMI Scores",
              data: List<FlSpot>.generate(
                  model.content.amis.length,
                  (index) => FlSpot(model.content.amis[index].index + 1, model.content.amis[index].score.toDouble())
              ),
            ),

            GradePanel(grades: model.content.amis.toList(), label: "AMI"),

            GradePanel(grades: model.content.samis.toList(), label: "SAMI"),

            GradePanel(grades: model.content.pais.toList(), label: "PAI"),
        ]
      )
    );
  }
}