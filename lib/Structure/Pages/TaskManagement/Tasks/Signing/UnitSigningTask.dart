import 'dart:async';

import 'package:falcon_net/Model/Database/UserEvent.dart';
import 'package:falcon_net/Structure/Components/AsyncPage.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Signing/UnitSigningEvent.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Database/UnitData.dart';
import '../../../../../Model/Store/Endpoints.dart';
import '../../../../../Utility/ErrorFormatting.dart';

class UnitSigningTask extends StatefulWidget {
  const UnitSigningTask({super.key});

  @override
  State<StatefulWidget> createState() => UnitSigningTaskState();
}


class UnitSigningTaskState extends State<UnitSigningTask> {
  late Future<UnitData> future;
  late List<UserEvent> events;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    future = Endpoints.getOwnUnit(null)
        .catchError((error, stackTrace) {
          displayError(prefix: "Signing", exception: error);
          return Future<UnitData>.error(error);
        })

        ..then((unit) {
          setState(() {
            events = unit.members
                .map((m) => m.events.toList())
                .reduce(
                    (carry, value) =>
                carry + value.where((e) => !carry.any((o) => o.event_id == e.event_id)).toList()
            );
          });
        });
  }

  @override
  void dispose() {
    super.dispose();
    if (timer != null) timer!.cancel();
  }

  @override
  Widget build(BuildContext context) => AsyncPage(
      title: "Event Signing",
      connection: future,
      builder: (context, data) => events
          .where((e) => e.time.isAfter(DateTime.now()))
          /*.where((e) => e.type != EventType.di.name)*/
          .map((event) =>
              PageWidget(
                  title: event.name ?? "Unnamed",
                  children: [
                    Text(
                      "Time: ${describeDate(event.time)}, ${describeTime(TimeOfDay.fromDateTime(event.time))}"
                    ),

                    if (event.description != null) Text(
                      "Description: ${event.description!}"
                    ),

                    ElevatedButton(
                        onPressed: () => showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            isScrollControlled: true,
                            showDragHandle: true,
                            builder: (context) => FractionallySizedBox(
                              heightFactor: 0.95,
                              child: UnitSigningEvent(
                                  retrieve: () => data,
                                  label: event.name ?? "Unnamed",
                                  statusLabel: "Individuals",
                                  event: event.event_id,
                                  padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
                              ),
                            )
                        ),
                        child: const Text("Open")
                    )
                  ]
              )
          ).toList()
  );
}