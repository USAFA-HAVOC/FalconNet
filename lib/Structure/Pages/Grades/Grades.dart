import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/UserGrades.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';
import 'package:falcon_net/Structure/Pages/Grades/GradePanel.dart';
import 'package:flutter/material.dart';

import '../../Components/PaddedColumn.dart';
import '../../Components/ViewModel.dart';

///Grades page displays sami and ami information in extension panel lists
class Grades extends StatelessWidget {
  const Grades({super.key});

  String calculateAverage(List<Grade> grades) {
    if (grades.isEmpty) {
      return "NA";
    }
    var sum = grades.map((grade) => grade.score).reduce((one, two) => one + two);
    return (sum / grades.length).round().toString();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(bottom: 10),
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                    "Grades",
                    style: Theme.of(context).textTheme.titleLarge
                ),
              ),

              Card(
                child: StoreConnector<GlobalState, ViewModel<UserGrades>>(
                  converter: (store) => ViewModel<UserGrades>(store: store, content: store.state.grades),
                  builder: (context, model) => PaddedColumn(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    padding: EdgeInsets.all(10),
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  calculateAverage(model.content.amis.toList()),
                                  style: Theme.of(context).textTheme.displayMedium,
                                ),

                                Text(
                                  "AMI Average",
                                  style: Theme.of(context).textTheme.titleSmall,
                                )
                              ],
                            ),
                          ),

                          VerticalDivider(thickness: 1,),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  calculateAverage(model.content.samis.toList()),
                                  style: Theme.of(context).textTheme.displayMedium,
                                ),

                                Text(
                                  "SAMI Average",
                                  style: Theme.of(context).textTheme.titleSmall,
                                )
                              ],
                            ),
                          )
                        ],
                      ),

                      Divider(thickness: 1,),

                      GradePanel(grades: model.content.amis.toList(), label: "AMI"),

                      GradePanel(grades: model.content.samis.toList(), label: "SAMI"),

                      GradePanel(grades: model.content.pais?.toList() ?? [], label: "PAI"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}