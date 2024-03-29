import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/AccountabilityEvent.dart';
import 'package:falcon_net/Model/Database/UserStatus.dart';
import 'package:falcon_net/Model/Store/Actions/SignAction.dart';
import 'package:falcon_net/Structure/Components/ConfirmationDialog.dart';
import 'package:falcon_net/Structure/Components/InfoBar.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Utility/ErrorFormatting.dart';
import 'package:falcon_net/Utility/ListExtensions.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import '../../../Model/Database/UserEvent.dart';
import '../../../Model/Store/GlobalState.dart';
import '../../Components/ViewModel.dart';

class Signatures extends StatelessWidget {
  final List<UserEvent> events;

  const Signatures({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    var sorted = events
        .where((e) => e.type != EventType.di.name)
        .where((e) =>
            e.accountability_method == AccountabilityMethod.self_signed.name)
        .where((e) => e.submission_deadline.isAfter(DateTime.now()))
        .where((e) => e.submission_start.isBefore(DateTime.now()))
        .toList()
        .sortedKey((e) => e.time);

    if (sorted.isEmpty) {
      return const PageWidget(title: "Attendance", children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "No Signable Events",
            textAlign: TextAlign.center,
          ),
        )
      ]);
    }

    return PageWidget(
      title: "Attendance",
      children: [
        ...sorted.map(
          (event) => InfoBar(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      describeDate(event.time.toLocal()),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      describeTime(
                          TimeOfDay.fromDateTime(event.time.toLocal())),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Text(
                  event.name ?? "Unnamed",
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 2,
                child: StoreConnector<GlobalState, ViewModel<void>>(
                  converter: (store) => ViewModel(store: store, content: null),
                  builder: (context, model) => event.status ==
                          UserStatus.signed.name
                      ? const Icon(Icons.check)
                      : IconButton(
                          icon: const Icon(FontAwesome5.pen_nib),
                          onPressed: () => showDialog(
                            context: context,
                            builder: (context) => ConfirmationDialog(
                              title: "Confirm Signing",
                              description:
                                  "Please confirm you have completed the requirements to sign for this "
                                  "event. This action cannot be undone.",
                              onConfirm: () async {
                                try {
                                  await model.dispatch(
                                      SignAction(event: event.event_id));

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text("Successfully Signed")));
                                } catch (e) {
                                  displayError(prefix: "Events", exception: e);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Failed to Sign")));
                                }
                              },
                            ),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
