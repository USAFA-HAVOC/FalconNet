 import 'package:falcon_net/Structure/Components/AsyncPage.dart';
import 'package:falcon_net/Structure/Components/LoadingShimmer.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/StanEval/SEAveragesWidget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Model/Database/UnitGrades.dart';
import '../../../../../Utility/Testing.dart';
import 'SEParameters.dart';

class SEUnit extends StatefulWidget {
  final String unit;

  const SEUnit({super.key, required this.unit});

  @override
  State<StatefulWidget> createState() => SEUnitState();
}

class SEUnitState extends State<SEUnit> {
  late Future<UnitGrades> connection;

  @override
  void initState() {
    //connection = Endpoints.unitGrades(widget.unit);
    connection = Future<UnitGrades>.delayed(const Duration(seconds: 2), () => generateGrades()).then((value) {
      print(value);
      return value;
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      return UnitGrades();
    });
    super.initState();
  }

  List<Widget> buildEvents({required UnitGrades unit, required void Function(String type, int index) onTap}) {
    Widget buildEventBar(String name, String type, int index) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Theme.of(context).dividerColor),
          ),

          child: InkWell(
            onTap: () => onTap(type, index),
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                          name,
                          style: Theme.of(context).textTheme.titleSmall,
                        )
                    ),
                  ],
                )
            ),
          )
      ),
    );

    List<Widget> bars = [];

    bars.addAll(List<Widget>.generate(7, (index) => buildEventBar("AMI #${index + 1}", "ami", index)));
    bars.addAll(List<Widget>.generate(2, (index) => buildEventBar("AMI #${index + 1}", "sami", index)));
    bars.addAll(List<Widget>.generate(2, (index) => buildEventBar("PAI #${index + 1}", "pai",  index)));

    return bars;
  }

  @override
  Widget build(BuildContext context) {
    return AsyncPage(
        title: widget.unit,
        connection: connection,
        placeholder: const [
          LoadingShimmer(height: 180,),

          LoadingShimmer(height: 500,),
        ],
        builder: (context, grades) => [
          SEAveragesWidget(
            unit: grades,
            onTap: () => context.push(
              "/task_management/stan_eval/unit/analytics",
              extra: SEParameters(
                name: widget.unit,
                grades: grades
              )
            ),
          ),

          PageWidget(
            title: "Submit Grade",
            children: buildEvents(
              unit: grades,
              onTap: (type, index) => context.push(
                  "/task_management/stan_eval/unit/event",
                extra: SEEventParameters(
                  type: type,
                  index: index,
                  members: grades.members
                )
              )
            )
          )
        ]
    );
  }
}