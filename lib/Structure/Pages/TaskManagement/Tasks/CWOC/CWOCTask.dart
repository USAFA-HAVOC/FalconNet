import 'dart:core';
import 'dart:math';

import 'package:falcon_net/Structure/Components/LoadingShimmer.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/CWOC/CWOCStatusWidget.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Shared/SigningWidget.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Data/DIStatus.dart';
import '../Shared/CWOCData.dart';
import '../Shared/Signee.dart';

///Page displaying information for CWOC controllers
///Shows statistics for groups as well as individual units
///Allows controller to view individual cadet statuses and sign if nessecary
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

  ///For local testing purposes only
  List<Signee> generateMembers(int count, DIStatus status) {
    String randString(int lengthOfString){
      final random = Random();
      const allChars='AaBbCcDdlMmNnOoPpQqRrSsTtUuVvWwXxYyZzEeFfGgHhIiJjKkL';
      final randomString = List.generate(lengthOfString, (index) => allChars[random.nextInt(allChars.length)]).join();
      return randomString;    // return the generated string
    }

    List<Signee> members = [];

    for (int i = 0; i < count; i++) {
      members.add(Signee(name: "Narpy Cadet #" + randString(5), id: randString(15), status: status));
    }

    return members;
  }

  ///For local testing purposes only
  UnitData generateUnit(UnitInfo info) {
    var members = generateMembers(info.signed, DIStatus.signedDI) +
        generateMembers(info.unsigned, DIStatus.unsigned) +
        generateMembers(info.out, DIStatus.signedOut);
    return UnitData(
        signed: info.signed,
        out: info.out,
        unsigned: info.unsigned,
        name: info.name,
        members: members,
        group: info.group,
    );
  }

  ///For local testing purposes only
  UnitInfo generateInfo(String name, int group, [int? count]) {
    Random r = Random();
    int total = count ?? 95 + r.nextInt(10);
    int signed = r.nextInt(total);
    int out = r.nextInt(total - signed);
    int unsigned = total - signed - out;
    return UnitInfo(
      signed: signed,
      out: out,
      unsigned: unsigned,
      name: name,
      group: group,
    );
  }

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

    connection.then((value) => (value?.units ?? []).forEach((unit) => setState(() {
      expansions[unit.name] = false;
    })));
  }

  ///Signs for an individual signee in a given unit
  void signFor(CWOCData cwoc, UnitData unit, Signee signee) {

    /// todo: replace with api call
    Future.delayed(Duration(milliseconds: 250), () => setState(() {
      connection = Future.value(cwoc.set(unit.name, unit.sign(signee)));
    }));
  }

  ///Loads a given unit based on the unit name
  void loadUnit(String unit) async {
    var cwoc = await connection;
    if (cwoc == null) {
      return;
    }

    /// todo: replace with api call
    UnitData actual = await Future.delayed(Duration(milliseconds: 250),
            () => generateUnit(cwoc.units.firstWhere((u) => u.name == unit))
    );

    setState(() {
      connection = Future.value(cwoc.set(unit, actual));
    });
  }

  ///Builds an expansion panel from unit information
  ///Displays current di progress
  ///Body allows controller to view individual signee status and sign if nessecary
  ExpansionPanel buildPanel(BuildContext context, CWOCData cwoc, UnitInfo unit) {
    Widget body;

    //Displays signing widget if full unit data is available
    if (unit is UnitData) {
      body = SigningWidget(
        di: Map<String, Signee>.fromEntries(unit.members.map((member) => MapEntry(member.id, member))),
        onSign: (id) => signFor(cwoc, unit, unit.members.firstWhere((m) => m.id == id)),
      );
    }

    //Otherwise displays a loading shimmer until results are available
    else {
      body = LoadingShimmer(height: 500,);
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
                    unitList = LoadingShimmer(height: 200,);
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
                          loadUnit(unit.name);
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