import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:flutter/material.dart';

import '../../Model/Data/UserGrades.dart';
import '../Components/PaddedColumn.dart';
import '../Components/ViewModel.dart';

///Grades page displays sami and ami information in extension panel lists
class Grades extends StatefulWidget {
  const Grades({super.key});

  @override
  State<Grades> createState() => GradesState();
}

class GradesState extends State<Grades> {
  List<bool> amiExtensions = List<bool>.filled(7, false);
  List<bool> samiExtensions = List<bool>.filled(2, false);

  ///Builds an extension panel for a particular grade with expansion state
  ///Works for both sami and ami grades
  ExpansionPanel buildGradePanel(String description, Grade grade, bool expanded) {
    return ExpansionPanel(
        isExpanded: expanded,
        headerBuilder: (context, open) => Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    description,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),

                Text(
                  grade.score.toString(),
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
        ),

        body: Padding(
          padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
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
                                  calculateAverage(model.content.amis),
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
                                  calculateAverage(model.content.samis),
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

                      Text(
                        "AMIs",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),

                      ExpansionPanelList(

                        //Closes all sami panels other than current one
                        expansionCallback: (index, status) {
                          setState(() {
                            amiExtensions = List<bool>.filled(7, false);
                            amiExtensions[index] = !status;
                          });
                        },

                        children: model.content.amis.asMap().map(
                                (key, value) => MapEntry(key, buildGradePanel("AMI #${(key + 1).toString()}", value, amiExtensions[key]))
                        ).values.toList(),
                      ),

                      Text(
                        "SAMIs",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),

                      ExpansionPanelList(

                        //Closes all sami panels other than current one
                        expansionCallback: (index, status) {
                          setState(() {
                            samiExtensions = List<bool>.filled(7, false);
                            samiExtensions[index] = !status;
                          });
                        },

                        children: model.content.samis.asMap().map(
                                (key, value) => MapEntry(key, buildGradePanel("SAMI #${(key + 1).toString()}", value, samiExtensions[key]))
                        ).values.toList(),
                      )
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