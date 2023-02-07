import 'dart:core';

import 'package:falcon_net/Model/Store/Endpoints.dart';
import 'package:falcon_net/Structure/Components/LoadingShimmer.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/CWOC/CWOCStatusWidget.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Shared/SigningWidget.dart';
import 'package:flutter/material.dart';

import '../../../../../Utility/UnitTesting.dart';
import '../Shared/CWOCData.dart';
import '../Shared/Signee.dart';

///Page displaying information for CWOC controllers
///Shows statistics for groups as well as individual units
///Allows controller to view individual cadet statuses and sign if necessary
class CWOCTask extends StatefulWidget {
  const CWOCTask({super.key});

  @override
  State<CWOCTask> createState() => CWOCTaskState();
}

class CWOCTaskState extends State<CWOCTask> {

  //CWOC data future which will populate with database query results
  late Future<CWOCData?> connection;

  //Expansion panel states for each unit
  Map<String, bool> expansions = {};

  ///Requests cwoc data from backend
  @override
  void initState() {
    super.initState();

    /// todo: replace with api call for unit summaries
    connection = Future.delayed(Duration(seconds: 1), () => CWOCData(units: [
      generateInfo("CG1", 1, 25),
      ...(List<UnitInfo>.generate(10, (index) => generateInfo("CS${index + 1}", 1))),
      generateInfo("CG2", 2, 25),
      ...(List<UnitInfo>.generate(10, (index) => generateInfo("CS${index + 1 + 10}", 2))),
      generateInfo("CG3", 3, 25),
      ...(List<UnitInfo>.generate(10, (index) => generateInfo("CS${index + 1 + 20}", 3))),
      generateInfo("CG4", 4, 25),
      ...(List<UnitInfo>.generate(10, (index) => generateInfo("CS${index + 1 + 30}", 4))),
    ]));

    try {
      print("Loading CWOC Data");
      Endpoints.cwocUnit(null).then((value) => print(value));
    }
    catch (e) {
      print("Error on loading CWOC data: ${e.toString()}");
    }

    connection.then((value) => (value?.units ?? []).forEach((unit) => setState(() {
      expansions[unit.name] = false;
    })));
  }

  ///Signs for an individual signee in a given unit
  void signFor(CWOCData cwoc, UnitData unit, Signee signee, ScaffoldMessengerState messenger) async {

    /// todo: replace with api call
    var success = await Future.delayed(Duration(milliseconds: 250), () => true);

    if (success) {
      setState(() {
        connection = Future.value(cwoc.set(unit.name, unit.sign(signee)));
      });
    }

    else {
      messenger.showSnackBar(
        const SnackBar(content: Text("Failed to sign"))
      );
    }
  }

  ///Loads a given unit based on the unit name
  void loadUnit(String unit, ScaffoldMessengerState messenger) async {
    var cwoc = await connection;
    if (cwoc == null) {
      return;
    }

    /// todo: replace with api call
    var success = await Future.delayed(Duration(milliseconds: 250), () => true);
    if (success) {
      UnitData actual = generateUnit(cwoc.units.firstWhere((u) => u.name == unit));
      setState(() {
        connection = Future.value(cwoc.set(unit, actual));
      });
    }
    else {
      messenger.showSnackBar(
        SnackBar(content: Text("Failed to load data for $unit"))
      );
    }
  }

  ///Builds an expansion panel from unit information
  ///Displays current di progress
  ///Body allows controller to view individual signee status and sign if necessary
  ExpansionPanel buildPanel(BuildContext context, CWOCData cwoc, UnitInfo unit) {
    Widget body;

    //Displays signing widget if full unit data is available
    if (unit is UnitData) {
      body = SigningWidget(
        di: unit,
        onSign: (signee) => signFor(cwoc, unit, unit.members.firstWhere((m) => m.id == signee.id), ScaffoldMessenger.of(context)),
      );
    }

    //Otherwise displays a loading shimmer until results are available
    else {
      body = const LoadingShimmer(height: 500,);
    }

    return ExpansionPanel(
        isExpanded: expansions[unit.name]!,
        backgroundColor: Theme.of(context).cardTheme.color,
        headerBuilder: (context, expanded) => Padding(
          padding: EdgeInsets.all(20),

          child: Row(
            children: [
              Expanded(
                  child: Text(
                    unit.name,
                    style: Theme.of(context).textTheme.titleSmall,
                  )
              ),

              Expanded(
                child: Text(
                  "${(unit.signed + unit.out)}/${unit.unsigned + unit.signed + unit.out}",
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.end,
                ),
              )
            ],
          ),
        ),

        body: Padding(
          padding: EdgeInsets.all(20),
          child: body,
        )
    );
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

              return LayoutBuilder(
                builder: (context, constraints) {
                  Widget status;

                  //Displays a group data as grid if screen is wide enough
                  if (constraints.maxWidth > 700) {
                    status = Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CWOCStatusWidget(units: units.where((unit) => unit.group == 1).toList(), label: "Group One"),

                              SizedBox(height: 20,),

                              CWOCStatusWidget(units: units.where((unit) => unit.group == 3).toList(), label: "Group Three"),
                            ],
                          ),
                        ),

                        SizedBox(width: 20,),

                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CWOCStatusWidget(units: units.where((unit) => unit.group == 2).toList(), label: "Group Two"),

                              SizedBox(height: 20,),

                              CWOCStatusWidget(units: units.where((unit) => unit.group == 4).toList(), label: "Group Four"),
                            ],
                          ),
                        )
                      ],
                    );
                  }

                  //Otherwise, displays in a simple column
                  else {
                    status = Column(
                      children: [
                        CWOCStatusWidget(units: units.where((unit) => unit.group == 1).toList(), label: "Group One"),

                        SizedBox(height: 20,),

                        CWOCStatusWidget(units: units.where((unit) => unit.group == 2).toList(), label: "Group Two"),

                        SizedBox(height: 20,),

                        CWOCStatusWidget(units: units.where((unit) => unit.group == 3).toList(), label: "Group Three"),

                        SizedBox(height: 20,),

                        CWOCStatusWidget(units: units.where((unit) => unit.group == 4).toList(), label: "Group Four"),
                      ],
                    );
                  }

                  Widget unitList;

                  //Displays a loading shimmer until results load
                  if (snapshot.data == null) {
                    unitList = const LoadingShimmer(height: 200,);
                  }

                  //Then displays an expansion panel list for each unit
                  else {
                    unitList = ExpansionPanelList(
                      children: (snapshot.data?.units ?? []).map((unit) =>
                          buildPanel(context, snapshot.data ?? CWOCData(units: []), unit)
                      ).toList(),

                      expansionCallback: (index, status) {
                        var unit = (snapshot.data?.units ?? [])[index];
                        if (unit is! UnitData) {
                          loadUnit(unit.name, ScaffoldMessenger.of(context));
                        }

                        setState(() {
                          expansions[units[index].name] = !status;
                        });
                      },
                    );
                  }

                  return Column(
                    children: [
                      status,

                      SizedBox(height: 20,),

                      unitList,
                    ],
                  );
                },
              );
            },
          ),
        ]
    );
  }
}