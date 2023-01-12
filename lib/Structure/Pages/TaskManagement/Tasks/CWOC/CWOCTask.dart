import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/CWOC/CWOCStatusWidget.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Data/CWOCData.dart';

class CWOCTask extends StatefulWidget {
  const CWOCTask({super.key});

  @override
  State<CWOCTask> createState() => CWOCTaskState();
}

class CWOCTaskState extends State<CWOCTask> {
  late Future<CWOCData?> connection;

  @override
  void initState() {
    super.initState();
    connection = Future.delayed(Duration(seconds: 1), () => CWOCData(units: [
      UnitData(signed: 5, out: 5, unsigned: 4, group: 1),
      UnitData(signed: 1, out: 5, unsigned: 4, group: 1),
      UnitData(signed: 4, out: 5, unsigned: 4, group: 1),
      UnitData(signed: 5, out: 23, unsigned: 4, group: 2),
      UnitData(signed: 5, out: 5, unsigned: 54, group: 2),
      UnitData(signed: 53, out: 5, unsigned: 4, group: 2),
      UnitData(signed: 15, out: 5, unsigned: 4, group: 2),
      UnitData(signed: 5, out: 55, unsigned: 34, group: 2),
      UnitData(signed: 35, out: 5, unsigned: 14, group: 3),
      UnitData(signed: 5, out: 5, unsigned: 34, group: 3),
      UnitData(signed: 35, out: 45, unsigned: 4, group: 3),
      UnitData(signed: 15, out: 55, unsigned: 54, group: 3),
    ]));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(20),
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
                "CWOC",
                style: Theme.of(context).textTheme.titleLarge
            ),
          ),

          FutureBuilder(
            future: connection,
            builder: (context, snapshot) {
              var units = snapshot.data?.units ?? [];

              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CWOCStatusWidget(units: units.where((unit) => unit.group == 1).toList(), label: "Group One"),

                        SizedBox(width: 20,),

                        CWOCStatusWidget(units: units.where((unit) => unit.group == 2).toList(), label: "Group Two"),
                      ],
                    ),
                  ),

                  SizedBox(width: 20,),

                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CWOCStatusWidget(units: units.where((unit) => unit.group == 3).toList(), label: "Group Three"),

                        SizedBox(width: 20,),

                        CWOCStatusWidget(units: units.where((unit) => unit.group == 4).toList(), label: "Group Four"),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ]
    );
  }
}