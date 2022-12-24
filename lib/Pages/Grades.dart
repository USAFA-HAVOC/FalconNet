import 'package:falcon_net/Model/GlobalState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../Model/UserGrades.dart';
import '../Shared/PaddedColumn.dart';

class Grades extends StatefulWidget {
  const Grades({super.key});

  @override
  State<Grades> createState() => GradesState();
}

class GradesState extends State<Grades> {
  List<bool> amiExtensions = List<bool>.filled(7, false);
  List<bool> samiExtensions = List<bool>.filled(2, false);

  ExpansionPanel buildGradePanel(String description, Grade grade, bool expanded) {
    return ExpansionPanel(
        isExpanded: expanded,
        headerBuilder: (context, open) => Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  flex: 10,
                  child: Text(
                    description,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    grade.score.toString(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                grade.description ?? "No description given",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          )
        )
    );
  }

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
      primary: false,
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 10),
      children: [
        Text(
          "Grades",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Card(
          child: StoreBuilder<GlobalState>(
            builder: (context, store) => PaddedColumn(
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
                            calculateAverage(store.state.grades.amis),
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
                            calculateAverage(store.state.grades.samis),
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
                Divider(
                  thickness: 1,
                ),
                Text(
                  "AMIs",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                ExpansionPanelList(
                  expansionCallback: (index, status) {
                    setState(() {
                      amiExtensions = List<bool>.filled(7, false);
                      amiExtensions[index] = !status;
                      print(!status);
                    });
                  },
                  children: store.state.grades.amis.asMap().map(
                          (key, value) => MapEntry(key, buildGradePanel("AMI #${key.toString()}", value, amiExtensions[key]))
                  ).values.toList(),
                ),
                Text(
                  "SAMIs",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                ExpansionPanelList(
                  expansionCallback: (index, status) {
                    setState(() {
                      samiExtensions = List<bool>.filled(7, false);
                      samiExtensions[index] = !status;
                      print(!status);
                    });
                  },
                  children: store.state.grades.samis.asMap().map(
                          (key, value) => MapEntry(key, buildGradePanel("SAMI #${key.toString()}", value, samiExtensions[key]))
                  ).values.toList(),
                )
              ],
            ),
          ),
        ),

      ],
    );
  }
}