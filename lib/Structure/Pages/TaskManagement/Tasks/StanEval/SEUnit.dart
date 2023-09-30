 import 'package:falcon_net/Model/Database/GradeType.dart';
import 'package:falcon_net/Model/Database/StringRequest.dart';
import 'package:falcon_net/Structure/Components/AsyncPage.dart';
import 'package:falcon_net/Structure/Components/InfoBar.dart';
import 'package:falcon_net/Structure/Components/LoadingShimmer.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Components/GradeAveragesWidget.dart';
import 'package:falcon_net/Utility/ErrorFormatting.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Model/Database/UnitGrades.dart';
import '../../../../../Model/Store/Endpoints.dart';
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
    connection = Endpoints.unitGrades(StringRequest((s) => s..string = widget.unit)).onError((error, stackTrace) {
      displayError(prefix: "S/E Unit", exception: error!);
      return UnitGrades();
    });

    super.initState();
  }

  List<Widget> buildEvents({required UnitGrades unit, required void Function(GradeType type, int index) onTap}) {
    Widget buildEventBar(String name, GradeType type, int index) => InfoBar(
      onTap: () => onTap(type, index),
      interiorPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      children: [
        Expanded(
          child: Text(
            name,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ],
    );

    List<Widget> bars = [];

    bars.addAll(List<Widget>.generate(7, (index) => buildEventBar("AMI #${index + 1}", GradeType.ami, index)));
    bars.addAll(List<Widget>.generate(2, (index) => buildEventBar("SAMI #${index + 1}", GradeType.sami, index)));
    bars.addAll(List<Widget>.generate(2, (index) => buildEventBar("PAI #${index + 1}", GradeType.pai,  index)));

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
          GradeAveragesWidget.unit(
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
                  members: grades.members.toList(),
                  grades: grades
                )
              )
            )
          )
        ]
    );
  }
}