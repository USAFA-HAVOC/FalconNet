import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/CadetPass.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';

import '../../Model/Database/User.dart';

///Widget for displaying current pass status
class PassStatus extends StatelessWidget {
  const PassStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: StoreConnector<GlobalState, ViewModel<User>>(
              converter: (store) => ViewModel<User>(
                  store: store,
                  content: store.state.user),
              builder: (context, model) {
                if (model.content.accountability?.current_pass == null) {
                  if (!(model.content.pass_allocation?.effective_pass_status ?? true)) {
                    return Card(
                        color: Theme.of(context).errorColor,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "Pass Status:",
                                  style:
                                  Theme.of(context).textTheme.headlineLarge,
                                ),
                              ),
                              Text(
                                "Here",
                                style: Theme.of(context).textTheme.headlineLarge,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  "Passes are Closed",
                                  style:
                                  Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                            ],
                          ),
                        )
                    );
                  }
                  else {
                    //If there is no current pass, display blue passes are open message
                    return Card(
                        color: Theme.of(context).focusColor,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "Pass Status:",
                                  style:
                                  Theme.of(context).textTheme.headlineLarge,
                                ),
                              ),
                              Text(
                                "Here",
                                style: Theme.of(context).textTheme.headlineLarge,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  "Passes are Open",
                                  style:
                                  Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                            ],
                          ),
                        )
                    );
                  }
                }
                else {
                  //If there is a current pass, display pass information
                  //Determine expiration message
                  CadetPass pass = model.content.accountability!.current_pass!.toLocal();
                  String expiration;
                  bool expired = false;

                  if (pass.end_time.isBefore(DateTime.now())) {
                    expiration =
                        "Expired: ${describeDate(pass.end_time)} ${describeTime(TimeOfDay.fromDateTime(pass.end_time))}";
                    expired = true;
                  } else if (pass.end_time
                              .difference(DateTime.now())
                              .compareTo(const Duration(hours: 24)) <
                          0 &&
                      pass.end_time.weekday == DateTime.now().weekday) {
                    expiration =
                        "Expires: ${describeTime(TimeOfDay.fromDateTime(pass.end_time))}";
                  } else if (pass.end_time
                          .difference(DateTime.now())
                          .compareTo(const Duration(days: 7)) <
                      0) {
                    expiration =
                        "Expires: ${formatWeekday(pass.end_time.weekday)}, ${describeTime(TimeOfDay.fromDateTime(pass.end_time))}";
                  } else {
                    expiration =
                        "Expires: ${describeDate(pass.end_time)}, ${describeTime(TimeOfDay.fromDateTime(pass.end_time))}";
                  }

                  //Display a gray card with expiration time/date
                  return Card(
                    color: !expired
                        ? Theme.of(context).canvasColor
                        : Theme.of(context).errorColor,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Pass Status:",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          Text(
                            "Signed-Out",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              expiration,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }),
        )
      ],
    );
  }
}
