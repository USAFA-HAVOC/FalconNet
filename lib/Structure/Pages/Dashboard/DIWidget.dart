import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/UserEvent.dart';
import 'package:falcon_net/Model/Database/UserStatus.dart';
import 'package:falcon_net/Model/Store/Actions/SignAction.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Services/SchedulingService.dart';
import 'package:falcon_net/Structure/Components/ConfirmationDialog.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:falcon_net/Utility/ListExtensions.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';

import '../../../Model/Database/AccountabilityEvent.dart';
import '../../../Model/Database/Role.dart';
import '../../../Utility/FNConstants.dart';

///Page widget for displaying DI information with signing ui
class DIWidget extends StatelessWidget {
  final String title;

  const DIWidget({super.key, this.title = "Dormitory Inspection"});

  @override
  Widget build(BuildContext context) {
    var messenger = ScaffoldMessenger.of(context);
    return StoreConnector<GlobalState, ViewModel<GlobalState>>(
        converter: (store) =>
            ViewModel<GlobalState>(store: store, content: store.state),
        builder: (context, model) => ScheduledBuilder(
            id: "di",
            builder: (context, payload) {
              //Determine text based on state values
              List<Widget> text;

              //Whether cadet is able to sign own di based on roles
              bool senior = model.content.user.roles
                  .any((role) => role.name == Roles.signable.name);

              //Determines whether time is signable
              // bool time = !DateTime.now()
              //     .isBefore(combineDate(DateTime.now(), diOpens));

              DateTime now = DateTime.now().toUtc();

              UserEvent? di;

              Iterable<UserEvent> options = model.content.events
                  .where((e) => e.type == EventType.di.name)
                  .where(
                      (e) => e.time.toUtc().difference(now).inHours.abs() < 24)
                  .toList()
                  .sortedKey(
                      (e) => e.time.difference(DateTime.now()).inSeconds.abs());

              UserStatus status;
              bool diTime;
              String diTimeStr;

              if (options.isNotEmpty) {
                di = options.first;
                diTime = di.submission_start.isBefore(now) && di.submission_deadline.isAfter(now);
                if (di.submission_start.isAfter(now)) {
                  diTimeStr = "DI Opens at ${di.submission_start.toLocal().hour}:${di.submission_start.toLocal().minute}";
                } else if (di.submission_deadline.isAfter(now)) {
                  diTimeStr = "DI is due at ${di.submission_start.toLocal().hour}:${di.submission_start.toLocal().minute}, please sign in or out";
                } else {
                  diTimeStr = "DI is closed";
                }
                status = UserStatusNames.parse(di.status);
              } else {
                status = UserStatus.unsigned;
                diTime = false;
                diTimeStr = "unable to find DI event";
              }

              bool signable = status == UserStatus.unsigned && senior && diTime;

              switch (status) {
                case UserStatus.unassigned:
                  text = [
                    Text(
                      "User not assigned to DI Event",
                      style: Theme.of(context).textTheme.headlineMedium,
                    )
                  ];
                  break;
                case UserStatus.leave:
                  text = [
                    Text(
                      "Currently on Leave",
                      style: Theme.of(context).textTheme.headlineMedium,
                    )
                  ];
                  break;
                case UserStatus.signed:
                  text = [
                    Text(
                      "DI Signed by ${di?.signature_name ?? "Unknown"}",
                      style: Theme.of(context).textTheme.headlineMedium,
                    )
                  ];
                  break;
                case UserStatus.out_returning:
                  text = [
                    Text(
                      "Pass ends before Taps, you must sign in and get accounted for tonight",
                      style: Theme.of(context).textTheme.headlineMedium,
                    )
                  ];
                  break;
                case UserStatus.overdue:
                case UserStatus.out:
                  text = [
                    Text(
                      "Signed out for the night",
                      style: Theme.of(context).textTheme.headlineMedium,
                    )
                  ];
                  break;
                case UserStatus.excused:
                  text = [
                    Text(
                      "Excused from DI",
                      style: Theme.of(context).textTheme.headlineMedium,
                    )
                  ];
                  break;
                case UserStatus.unsigned:
                  text = [
                    Text(
                      diTimeStr,
                      style: Theme.of(context).textTheme.headlineMedium,
                    )
                  ];
                  break;
              }

              //Sets content to card with info text
              List<Widget> content = [
                Card(
                    elevation: 0,
                    color: signable
                        ? Theme.of(context).focusColor
                        : Theme.of(context).focusColor,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: text,
                      ),
                    )),
              ];

              //If signable, add button to sign di
              if (signable) {
                content.add(
                  ElevatedButton(
                    //Dispatch sign di action
                    onPressed: () => showDialog(
                        context: context,
                        builder: (context) => ConfirmationDialog(
                            title: "Sign DI",
                            description:
                                "Confirm that you are at the location of your domicile. "
                                "This action cannot be undone.",
                            onConfirm: () => model.dispatch(SignAction(
                                event: di!.event_id,
                                onSucceed: () => messenger.showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("DI Signed Successfully"))),
                                onFail: () => messenger.showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Failed to Sign DI"))))))),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Sign',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ),
                );
              }

              //Return Page Widget with given content
              return PageWidget(title: title, children: content);
            }));
  }
}
