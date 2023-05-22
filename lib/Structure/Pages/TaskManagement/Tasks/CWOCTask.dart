import 'dart:async';
import 'dart:core';

import 'package:falcon_net/Model/Database/DIRequest.dart';
import 'package:falcon_net/Model/Database/SignRequest.dart';
import 'package:falcon_net/Model/Database/UnitData.dart';
import 'package:falcon_net/Model/Database/UnitDataRequest.dart';
import 'package:falcon_net/Model/Database/UnitSummary.dart';
import 'package:falcon_net/Model/Database/UserSummary.dart';
import 'package:falcon_net/Model/Database/WingData.dart';
import 'package:falcon_net/Model/Store/Endpoints.dart';
import 'package:falcon_net/Structure/Components/LoadingShimmer.dart';
import 'package:falcon_net/Structure/Components/UnitStatusWidget.dart';
import 'package:flutter/material.dart';

import '../../../../Utility/ErrorFormatting.dart';
import '../../../Components/AsyncPage.dart';
import 'Shared/SigningWidget.dart';

///Page displaying information for CWOC controllers
///Shows statistics for groups as well as individual units
///Allows controller to view individual cadet statuses and sign if necessary
class CWOCTask extends StatefulWidget {
  final String label;

  const CWOCTask({super.key, this.label = "CWOC"});

  @override
  State<CWOCTask> createState() => CWOCTaskState();
}

class CWOCTaskState extends State<CWOCTask> {

  //CWOC data future which will populate with database query results
  late Future<WingData> connection;
  List<UnitData> loaded = [];

  //Expansion panel states for each unit
  Map<String, bool> expansions = {};

  late Timer timer;

  ///Requests cwoc data from backend
  @override
  void initState() {
    super.initState();

    connection = Endpoints.getWing(null).onError((error, stackTrace) {
      displayError(prefix: "CWOC", exception: error!);
      return WingData();
    });

    connection.then((value) => setState(() {
      for (var unit in value.units.toList()) {
        expansions[unit.unit.name] = false;
      }
    }));

    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      setState(() {
        connection = Endpoints.getWing(null)
            .catchError((error, stackTrace) {
          displayError(prefix: "CWOC", exception: error);
          return WingData();
        })
        ..then((units) {
          for (var unit in units.units) {
            if (!expansions.containsKey(unit.unit.name)) {
              expansions[unit.unit.name] = false;
            }
          }
        });
      });

      for (var unit in expansions.entries.where((e) => e.value).map((e) => e.key)) {
        loadUnit(unit, null);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  ///Signs for an individual signee in a given unit
  void signFor(WingData wing, UnitData unit, UserSummary signee, ScaffoldMessengerState messenger) async {

    try {
      await Endpoints.signEvent(SignRequest((s) => s
          ..event_id = null
          ..user_id = signee.user_id
      ));

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
  void loadUnit(String unit, ScaffoldMessengerState? messenger) async {
    var wing = await connection;

    try {
      UnitData actual = await Endpoints.getUnit(UnitDataRequest((b) => b..unit = unit));
      setState(() {
        connection = Future.value(wing.set(actual));
        loaded.removeWhere((u) => u.unit.name == unit);
        loaded.add(actual);
      });
    }

    catch (e) {
      displayError(prefix: "CWOC", exception: e);
      messenger?.showSnackBar(
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
        onSign: (signee) => signFor(wing, data, data.members.firstWhere((m) => m.user_id == signee.user_id), ScaffoldMessenger.of(context)),
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
    List<String> groups = Set<String>.from(units.where((unit) => unit.unit.parent != null).map((u) => u.unit.parent!)).toList();
    groups.sort();

    List<Widget> left = [];
    List<Widget> right = [];
    for (int g = 0; g < groups.length; g++) {
      var group = groups[g];

      (g % 2 == 0 ? left : right).addAll(
        [
          UnitStatusWidget.fromList(units: units, label: group),

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
    List<String> groups = Set<String>.from(
        units.where((unit) => unit.unit.sub_units.isEmpty && unit.unit.parent != null)
            .map((u) => u.unit.parent!)
    ).toList();

    groups.sort();

    List<Widget> children = [];

    for (var group in groups) {
      children.addAll([
        UnitStatusWidget.fromList(units: units.where((u) => u.unit.parent == group).toList(), label: group),

        const SizedBox(height: 20,),
      ]);
    }

    return Column(
      children: children,
    );
  }


  @override
  Widget build(BuildContext context) {
    return AsyncPage(
      title: widget.label,
      connection: connection,
      placeholder: [
        LayoutBuilder(
          builder: (context, constraints) {
            //Displays a group data as grid if screen is wide enough
            if (constraints.maxWidth > 700) {
              return Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        LoadingShimmer(height: 200,),

                        SizedBox(height: 20,),

                        LoadingShimmer(height: 200,),

                        SizedBox(height: 20,),
                      ],
                    ),
                  ),

                  const SizedBox(width: 20,),

                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        LoadingShimmer(height: 200,),

                        SizedBox(height: 20,),

                        LoadingShimmer(height: 200,),

                        SizedBox(height: 20,),
                      ],
                    ),
                  ),
                ],
              );
            }

            //Otherwise, displays in a simple column
            else {
              return Column(
                children: const [
                  LoadingShimmer(height: 200,),

                  SizedBox(height: 20,),

                  LoadingShimmer(height: 200,),

                  SizedBox(height: 20,),

                  LoadingShimmer(height: 200,),

                  SizedBox(height: 20,),

                  LoadingShimmer(height: 200,),

                  SizedBox(height: 20,),
                ],
              );
            }
          },
        )
      ],
      builder: (context, data) {
        var units = data.units.toList();
        return [
          LayoutBuilder(
            builder: (context, constraints) {
              //Displays a group data as grid if screen is wide enough
              if (constraints.maxWidth > 700) {
                return buildStatusGrid(units);
              }

              //Otherwise, displays in a simple column
              else {
                return buildStatusColumn(units);
              }
            },
          ),

          ExpansionPanelList(
            children: units.toList().map((unit) =>
                buildPanel(context, data, unit)
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
          )
        ];
      },
    );
  }
}