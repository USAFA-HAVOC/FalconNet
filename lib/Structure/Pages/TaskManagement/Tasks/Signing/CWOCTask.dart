import 'dart:async';

import 'package:falcon_net/Model/Database/StringRequest.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Database/AccountabilityEvent.dart';
import '../../../../../Model/Store/Endpoints.dart';
import '../../../../../Utility/ErrorFormatting.dart';
import '../../../../../Utility/TemporalFormatting.dart';
import '../../../../Components/AsyncPage.dart';
import '../../../../Components/PageWidget.dart';
import 'WingSigningEvent.dart';

class CWOCTask extends StatefulWidget {
  final String label;

  const CWOCTask({super.key, this.label = "CWOC"});

  @override
  State<StatefulWidget> createState() => CWOCTaskState();
}

class CWOCTaskState extends State<CWOCTask> {
  late Future<List<AccountabilityEvent>> future;

  @override
  void initState() {
    super.initState();
    future = Endpoints.getEvents(null)
        .then((list) => list.events.toList())
        .catchError((error, stackTrace) {
          print(stackTrace);
          displayError(prefix: "CWOC", exception: error);
          return Future<List<AccountabilityEvent>>.error(error);
        });
  }

  @override
  Widget build(BuildContext context) => AsyncPage(
      title: widget.label,
      connection: future,
      builder: (context, data) {
        var applicable = data
            .where((e) => e.time.isAfter(DateTime.now().subtract(const Duration(days: 2))));

        if (applicable.isEmpty) {
          return [const Padding(
            padding: EdgeInsets.all(20),
            child: Center(child: Text("No Signable Events"),),
          )];
        }

        print(applicable);

        return applicable.map((event) =>
            PageWidget(
                title: event.name ?? (event.type == EventType.di.name ? "DI ${describeDate(event.time.toLocal())}" : "Unnamed"),
                children: [
                  Text(
                      "Due: ${describeDate(event.submission_deadline.toLocal())}, ${describeTime(TimeOfDay.fromDateTime(event.submission_deadline.toLocal()))}"
                  ),

                  if (event.description != null) Text(
                      "Description: ${event.description!}"
                  ),

                  if (!kIsWeb) ElevatedButton(
                      onPressed: () => showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                          isScrollControlled: true,
                          showDragHandle: true,
                          builder: (context) => FractionallySizedBox(
                            heightFactor: 1.0,
                            widthFactor: 1.0,
                            child: WingSigningEvent(
                              retrieve: () => Endpoints.getWing((StringRequestBuilder()..string = event.id!).build()),
                              label: event.name ?? (event.type == EventType.di.name ? "DI" : "Unnamed"),
                              event: event.id!,
                              refresh: 10,
                              padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
                              excusable: event.type != EventType.di.name,
                              frozen: !(event.submission_deadline.isAfter(DateTime.now()) && event.submission_start.isBefore(DateTime.now())),
                            ),
                          )
                      ),
                      child: const Text("Open")
                  )

                  else ElevatedButton(
                      onPressed: () => showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            insetPadding: const EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 10),
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: CloseButton(),
                                ),

                                WingSigningEvent(
                                  retrieve: () => Endpoints.getWing((StringRequestBuilder()..string = event.id!).build()),
                                  label: event.name ?? (event.type == EventType.di.name ? "DI" : "Unnamed"),
                                  event: event.id!,
                                  refresh: 10,
                                  padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
                                  excusable: event.type != EventType.di.name,
                                  frozen: !(event.submission_start.isBefore(DateTime.now()) && event.submission_deadline.isAfter(DateTime.now())),
                                ),
                              ],
                            )
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