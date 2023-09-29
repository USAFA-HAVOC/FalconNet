import 'dart:async';
import 'dart:core';

import 'package:falcon_net/Model/Database/SignRequest.dart';
import 'package:falcon_net/Model/Database/UnitData.dart';
import 'package:falcon_net/Model/Database/UnitDataRequest.dart';
import 'package:falcon_net/Model/Database/UnitSummary.dart';
import 'package:falcon_net/Model/Database/UserSummary.dart';
import 'package:falcon_net/Model/Database/WingData.dart';
import 'package:falcon_net/Model/Store/Endpoints.dart';
import 'package:falcon_net/Structure/Components/LoadingShimmer.dart';
import 'package:falcon_net/Structure/Components/UnitStatusWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../Utility/ErrorFormatting.dart';
import '../../../../Components/AsyncPage.dart';
import 'SigningWidget.dart';

///Page displaying information for CWOC controllers
///Shows statistics for groups as well as individual units
///Allows controller to view individual cadet statuses and sign if necessary
class WingSigningEvent extends StatefulWidget {
  final String label;
  final String event;
  final bool excusable;
  final EdgeInsets padding;
  final FutureOr<WingData> Function() retrieve;
  final int? refresh;
  final bool frozen;

  const WingSigningEvent(
      {super.key,
      this.label = "CWOC",
      required this.event,
      required this.retrieve,
      required this.frozen,
      this.refresh,
      required this.excusable,
      this.padding = const EdgeInsets.all(20)});

  @override
  State<WingSigningEvent> createState() => WingSigningEventState();
}

class WingSigningEventState extends State<WingSigningEvent> {
  //CWOC data future which will populate with database query results
  late Future<WingData> connection;
  List<UnitData> loaded = [];

  //Expansion panel states for each unit
  Map<String, bool> expansions = {};

  Timer? timer;

  ///Requests cwoc data from backend
  @override
  void initState() {
    super.initState();

    connection = Future.value(widget.retrieve()).onError((error, stackTrace) {
      displayError(prefix: "CWOC", exception: error!);
      return Future<WingData>.error(error);
    })
      ..then((value) => setState(() {
            for (var unit in value.units.toList()) {
              expansions[unit.unit.name] = false;
            }

            if (widget.refresh != null) {
              timer =
                  Timer.periodic(Duration(seconds: widget.refresh!), (timer) {
                setState(() {
                  connection = Future.value(widget.retrieve())
                      .catchError((error, stackTrace) {
                    displayError(prefix: "CWOC", exception: error);
                    return value;
                  })
                    ..then((units) {
                      for (var unit in units.units) {
                        if (!expansions.containsKey(unit.unit.name)) {
                          expansions[unit.unit.name] = false;
                        }
                      }
                    });
                });

                for (var unit in expansions.entries
                    .where((e) => e.value)
                    .map((e) => e.key)) {
                  loadUnit(unit, null);
                }
              });
            }
          }));
  }

  @override
  void dispose() {
    super.dispose();
    if (timer != null) timer!.cancel();
  }

  ///Signs for an individual signee in a given unit
  void signFor(WingData wing, UnitData unit, UserSummary signee,
      ScaffoldMessengerState messenger) async {
    try {
      await Endpoints.signEvent(SignRequest((s) => s
        ..event_id = widget.event
        ..user_id = signee.user_id));

      setState(() {
        UnitData signed = unit.sign(signee, event: widget.event);
        connection = Future.value(wing.set(signed));
        loaded = loaded.where((u) => signed.unit.name != u.unit.name).toList() +
            [signed];
      });

      messenger
          .showSnackBar(const SnackBar(content: Text("Successfully Signed")));
    } catch (e) {
      displayError(prefix: "CWOC", exception: e);
      messenger.showSnackBar(const SnackBar(content: Text("Failed to sign")));
    }
  }

  ///Signs for an individual signee in a given unit
  void excuseFor(WingData wing, UnitData unit, UserSummary signee,
      ScaffoldMessengerState messenger) async {
    try {
      var excusal = await Endpoints.excuseOther(SignRequest((s) => s
        ..event_id = widget.event
        ..user_id = signee.user_id));

      setState(() {
        UnitData excused = unit.excuse(signee, excusal, event: widget.event);
        connection = Future.value(wing.set(excused));
        loaded =
            loaded.where((u) => excused.unit.name != u.unit.name).toList() +
                [excused];
      });

      messenger
          .showSnackBar(const SnackBar(content: Text("Successfully Signed")));
    } catch (e) {
      displayError(prefix: "CWOC", exception: e);
      messenger.showSnackBar(const SnackBar(content: Text("Failed to sign")));
    }
  }

  ///Loads a given unit based on the unit name
  void loadUnit(String unit, ScaffoldMessengerState? messenger) async {
    var wing = await connection;

    try {
      UnitData actual = await Endpoints.getUnit(
          UnitDataRequest.direct(unit: unit, event: widget.event));
      setState(() {
        //connection = Future.value(wing.set(actual));
        loaded.removeWhere((u) => u.unit.name == unit || u.total == 0);
        loaded.add(actual);
      });
    } catch (e) {
      displayError(prefix: "CWOC", exception: e);
      messenger?.showSnackBar(
          SnackBar(content: Text("Failed to load data for $unit")));
    }
  }

  ///Builds an expansion panel from unit information
  ///Displays current di progress
  ///Body allows controller to view individual signee status and sign if necessary
  ExpansionPanel buildPanel(
      BuildContext context, WingData wing, UnitSummary unit) {
    Widget body;

    //Displays signing widget if full unit data is available
    if (loaded.any((u) => u.unit.name == unit.unit.name)) {
      var data = loaded.firstWhere((u) => u.unit.name == unit.unit.name);
      body = SigningWidget(
        frozen: widget.frozen,
        status: data,
        event: widget.event,
        onSign: (signee) => signFor(
            wing,
            data,
            data.members.firstWhere((m) => m.user_id == signee.user_id),
            ScaffoldMessenger.of(context)),
        onExcuse: widget.excusable
            ? (member) => excuseFor(
                wing,
                data,
                data.members.firstWhere((m) => m.user_id == member.user_id),
                ScaffoldMessenger.of(context))
            : null,
      );
    }

    //Otherwise displays a loading shimmer until results are available
    else {
      body = const LoadingShimmer(
        height: 500,
      );
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
                  )),
                  Expanded(
                    child: Text(
                      "${(unit.signed! + unit.out! + (unit.leave ?? 0) + (unit.excused!))}/${unit.total!}",
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
        ));
  }

  Widget buildWebPanel(BuildContext context, WingData wing, UnitSummary unit) {
    Widget body;

    //Displays signing widget if full unit data is available
    if (loaded.any((u) => u.unit.name == unit.unit.name)) {
      var data = loaded.firstWhere((u) => u.unit.name == unit.unit.name);
      body = SigningWidget(
        frozen: widget.frozen,
        status: data,
        event: widget.event,
        onSign: (signee) => signFor(
            wing,
            data,
            data.members.firstWhere((m) => m.user_id == signee.user_id),
            ScaffoldMessenger.of(context)),
        onExcuse: widget.excusable
            ? (member) => excuseFor(
                wing,
                data,
                data.members.firstWhere((m) => m.user_id == member.user_id),
                ScaffoldMessenger.of(context))
            : null,
      );
    }

    //Otherwise displays a loading shimmer until results are available
    else {
      body = const LoadingShimmer(
        height: 500,
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Theme.of(context).dividerColor),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    unit.unit.name,
                    style: Theme.of(context).textTheme.titleSmall,
                  )),
                  Expanded(
                    child: Text(
                      "${(unit.signed! + unit.out! + (unit.leave ?? 0) + (unit.excused!))}/${unit.total!}",
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  setState(() => expansions[unit.unit.name] =
                      !expansions[unit.unit.name]!);
                  loadUnit(unit.unit.name, ScaffoldMessenger.of(context));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    expansions[unit.unit.name]! ? "Close" : "Open",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
            ),
            if (expansions[unit.unit.name]!)
              Padding(
                padding: const EdgeInsets.all(20),
                child: body,
              )
          ],
        ),
      ),
    );
  }

  List<Widget> buildStatusGrid(List<UnitSummary> units) {
    List<String> groups = Set<String>.from(units
        .where((unit) =>
            unit.unit.parent_units.length >= 2 && (unit.total ?? 0) > 0)
        .map((u) => u.unit.parent_units[1])).toList();
    groups.sort();
    return groups.map((group) => UnitStatusWidget.fromList(
        units: units
            .where((u) => u.unit.parent_units.contains(group))
            .toList(),
        label: group
    )).toList();
  }

  List<Widget> buildStatusColumn(List<UnitSummary> units) {
    List<String> groups = Set<String>.from(units
        .where((unit) =>
            unit.unit.parent_units.length >= 2 && (unit.total ?? 0) > 0)
        .map((u) => u.unit.parent_units[1])).toList();

    groups.sort();
    return groups.map((group) => UnitStatusWidget.fromList(
      label: group,
      units: units
          .where((u) => u.unit.parent_units.isNotEmpty)
          .where((u) => u.unit.parent_units.last == group)
          .toList(),
    )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return AsyncPage.wrap(
      title: widget.label,
      connection: connection,
      minWrapWidth: 700,
      wrappedBuilder: (context, data) => buildStatusColumn(data.units.toList()),
      stackedBuilder: (context, data) => [
        if (kIsWeb)
          ListView(
            primary: true,
            shrinkWrap: true,
            children: data.units
                .toList()
                .map((unit) => buildWebPanel(context, data, unit))
                .toList(),
          )
        else
          ExpansionPanelList(
            children: data.units
                .toList()
                .map((unit) => buildPanel(context, data, unit))
                .toList(),
            expansionCallback: (index, status) {
              var unit = data.units.toList()[index];
              if (!loaded.any((u) => unit.unit.name == u.unit.name) &&
                  !status) {
                loadUnit(unit.unit.name, ScaffoldMessenger.of(context));
              }

              setState(() {
                expansions[unit.unit.name] = !status;
              });
            },
          )
      ],
    );
  }
}
