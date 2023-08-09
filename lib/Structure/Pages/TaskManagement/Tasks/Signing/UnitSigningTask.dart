import 'dart:async';

import 'package:falcon_net/Model/Database/AccountabilityEvent.dart';
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
  late Future<List<AccountabilityEvent>> future;

  @override
  void initState() {
    super.initState();
    future = Endpoints.getEvents(null)
      .then((list) => list.events.toList())
      .catchError((error, stackTrace) {
        print(stackTrace);
        displayError(prefix: "Signing", exception: error);
        return Future<List<AccountabilityEvent>>.error(error);
      });
  }

  FutureOr<UnitData> retrieve(String event) => Endpoints.getOwnUnit(event)
      .catchError((error, stackTrace) {
        displayError(prefix: "Signing", exception: error);
        return Future<UnitData>.error(error);
      });

  @override
  Widget build(BuildContext context) => AsyncPage(
      title: "Event Signing",
      connection: future,
      builder: (context, data) {
        var applicable = data
            .where((e) => e.submission_deadline.isAfter(DateTime.now()))
            .where((e) =>
                e.accountability_method == AccountabilityMethod.squadron_based.name ||
                e.accountability_method == AccountabilityMethod.self_signed.name
            );

        if (applicable.isEmpty) {
          return [const Padding(
            padding: EdgeInsets.all(20),
            child: Center(child: Text("No Signable Events"),),
          )];
        }

        return applicable
            .map((event) =>
              PageWidget(
                  title: event.name ?? "Unnamed",
                  children: [
                    Text(
                        "Due: ${describeDate(event.submission_deadline)}, ${describeTime(TimeOfDay.fromDateTime(event.submission_deadline))}"
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
                              heightFactor: 1.0,
                              child: UnitSigningEvent(
                                retrieve: () => retrieve(event.id!),
                                label: event.name ?? "Unnamed",
                                statusLabel: "Individuals",
                                event: event.id,
                                padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
                              ),
                            )
                        ),
                        child: const Text("Open")
                    )
                  ]
              )
        ).toList();
      }
  );
}