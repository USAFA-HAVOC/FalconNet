import 'dart:core';

import 'package:falcon_net/Model/Database/DIRequest.dart';
import 'package:falcon_net/Model/Database/UnitData.dart';
import 'package:falcon_net/Model/Database/UnitDataRequest.dart';
import 'package:falcon_net/Model/Database/UnitSummary.dart';
import 'package:falcon_net/Model/Database/WingData.dart';
import 'package:falcon_net/Model/Store/Endpoints.dart';
import 'package:falcon_net/Structure/Components/FNPage.dart';
import 'package:falcon_net/Structure/Components/LoadingShimmer.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/CWOC/CWOCStatusWidget.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Shared/SigningWidget.dart';
import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';

import '../../../../../Model/Database/User.dart';
import '../../../../../Utility/ErrorFormatting.dart';

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
  late Future<WingData?> connection;
  List<UnitData> loaded = [];

  //Expansion panel states for each unit
  Map<String, bool> expansions = {};

  ///Requests cwoc data from backend
  @override
  void initState() {
    super.initState();

    /// todo: replace with api call for unit summaries

    connection = Endpoints.getWing(null).onError((error, stackTrace) {
      displayError(prefix: "CWOC", exception: error!);
      return WingData();
    });

    connection.then((value) => setState(() {
      for (var unit in value?.units.toList() ?? <UnitSummary>[]) {
        expansions[unit.unit.name] = false;
      }
    }));
  }

  ///Signs for an individual signee in a given unit
  void signFor(WingData wing, UnitData unit, User signee, ScaffoldMessengerState messenger) async {

    try {
      await Endpoints.signOther(DIRequest((b) => b..cadet_id = signee.id));

      setState(() {
        UnitData signed = unit.sign(signee);
        connection = Future.value(wing.set(signed));
        loaded = loaded.where((u) => signed.unit.name != u.unit.name).toList() + [signed];
      });
    }
    catch (e) {
      displayError(prefix: "CWOC", exception: e);
      messenger.showSnackBar(
        const SnackBar(content: Text("Failed to sign"))
      );
    }
  }

  ///Loads a given unit based on the unit name
  void loadUnit(String unit, ScaffoldMessengerState messenger) async {
    var wing = await connection;
    if (wing == null) {
      return;
    }

    try {
      UnitData actual = await Endpoints.getUnit(UnitDataRequest((b) => b..unit = unit));
      setState(() {
        connection = Future.value(wing.set(actual));
        loaded.add(actual);
      });
    }

    catch (e) {
      displayError(prefix: "CWOC", exception: e);
      messenger.showSnackBar(
          SnackBar(content: Text("Failed to load data for $unit"))
      );
    }
  }

  ///Builds an expansion panel from unit information
  ///Displays current di progress
  ///Body allows controller to view individual signee status and sign if necessary
  ExpansionPanel buildPanel(BuildContext context, WingData wing, UnitSummary unit) {
    Widget body;

    //Displays signing widget if full unit data is available
    if (loaded.any((u) => u.unit.name == unit.unit.name)) {
      var data = loaded.firstWhere((u) => u.unit.name == unit.unit.name);
      body = SigningWidget(
        di: data,
        onSign: (signee) => signFor(wing, data, data.members.firstWhere((m) => m.id == signee.id), ScaffoldMessenger.of(context)),
      );
    }

    //Otherwise displays a loading shimmer until results are available
    else {
      body = const LoadingShimmer(height: 500,);
    }

    return ExpansionPanel(
        isExpanded: expansions[unit.unit.name]!,
        backgroundColor: Theme.of(context).cardTheme.color,
        headerBuilder: (context, expanded) => Padding(
          padding: const EdgeInsets.all(20),

          child: Row(
            children: [
              Expanded(
                  child: Text(
                    unit.unit.name,
                    style: Theme.of(context).textTheme.titleSmall,
                  )
              ),

              Expanded(
                child: Text(
                  "${(unit.signed! + unit.out!)}/${unit.total!}",
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.end,
                ),
              )
            ],
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.all(20),
          child: body,
        )
    );
  }


  Widget buildStatusGrid(List<UnitSummary> units) {
    List<String> groups = Set<String>.from(units.where((unit) => unit.unit.group != null).map((u) => u.unit.group!)).toList();
    groups.sort();

    List<Widget> left = [];
    List<Widget> right = [];
    for (int g = 0; g < groups.length; g++) {
      var group = groups[g];

      (g % 2 == 0 ? left : right).addAll(
        [
          CWOCStatusWidget(units: units.where((unit) => unit.unit.group == group).toList(), label: group),
          const SizedBox(height: 20,)
        ]
      );
    }

    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: left,
          ),
        ),

        const SizedBox(width: 20,),

        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: right,
          ),
        ),
      ],
    );
  }

  Widget buildStatusColumn(List<UnitSummary> units) {
    List<String> groups = Set<String>.from(units.where((unit) => unit.unit.group != null).map((u) => u.unit.group!)).toList();
    groups.sort();

    List<Widget> children = [];

    for (var group in groups) {
      children.addAll([
        CWOCStatusWidget(units: units.where((u) => u.unit.group == group).toList(), label: group),

        const SizedBox(height: 20,),
      ]);
    }

    return Column(
      children: children,
    );
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: connection,
      builder: (context, snapshot) {

        var units = snapshot.data?.units.toList() ?? [];
        return LayoutBuilder(
          builder: (context, constraints) {
            Widget status;

            //Displays a group data as grid if screen is wide enough
            if (constraints.maxWidth > 700) {
              status = buildStatusGrid(units);
            }

            //Otherwise, displays in a simple column
            else {
              status = buildStatusColumn(units);
            }

            Widget unitList;

            //Displays a loading shimmer until results load
            if (snapshot.data == null) {
              unitList = const LoadingShimmer(height: 200,);
            }

            //Then displays an expansion panel list for each unit
            else {
              unitList = ExpansionPanelList(
                children: units.toList().map((unit) =>
                    buildPanel(context, snapshot.data ?? WingData((b) => b.units = BuiltList<UnitSummary>([]).toBuilder()), unit)
                ).toList(),

                expansionCallback: (index, status) {
                  var unit = units.toList()[index];
                  if (!loaded.any((u) => unit.unit.name == u.unit.name) && !status) {
                    loadUnit(unit.unit.name, ScaffoldMessenger.of(context));
                  }

                  setState(() {
                    expansions[unit.unit.name] = !status;
                  });
                },
              );
            }

            return FNPage(
                title: "CWOC",
                children: [
                  status,

                  unitList
                ]
            );
          },
        );
      },
    );
  }
}