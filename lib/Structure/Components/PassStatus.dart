import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/CadetPass.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Services/SchedulingService.dart';
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
                  content: store.state.user
              ),
              builder: (context, model) => ScheduledBuilder(
                  id: "pass",
                  builder: (context, payload) {
                    String status;
                    String tooltip;
                    bool expired = false;
                    bool closed = false;

                    if (!(model.content.accountability?.current_leave?.departure_time.isAfter(DateTime.now()) ?? true)) {
                      status = "On Leave";
                      tooltip = "Cannot Sign-Out on Leave";
                    }

                    else if (model.content.accountability?.current_pass == null) {
                      if (!(model.content.accountability?.effective_pass_status ?? true)) {
                        status = "Here";
                        tooltip = "Passes are Closed";
                        closed = true;
                      }
                      else {
                        status = "Here";
                        tooltip = "Passes Are Open";
                      }
                    }

                    else {
                      //If there is a current pass, display pass information
                      //Determine expiration message
                      CadetPass pass = model.content.accountability!.current_pass!.toLocal();
                      var difference = pass.end_time.difference(DateTime.now());
                      status = pass.description;

                      if (difference.inSeconds <= 0) {
                        tooltip =
                        "Expired: ${describeDate(pass.end_time)} ${describeTime(TimeOfDay.fromDateTime(pass.end_time))}";
                        expired = true;
                      }

                      else if (difference.inHours < 24 && pass.end_time.weekday == DateTime.now().weekday) {
                        tooltip =
                        "Expires: ${describeTime(TimeOfDay.fromDateTime(pass.end_time))}";
                      }

                      else if (difference.inDays < 7) {
                        tooltip =
                        "Expires: ${formatWeekday(pass.end_time.weekday)}, ${describeTime(TimeOfDay.fromDateTime(pass.end_time))}";
                      }

                      else {
                        tooltip =
                        "Expires: ${describeDate(pass.end_time)}, ${describeTime(TimeOfDay.fromDateTime(pass.end_time))}";
                      }
                    }
                    //Display a gray card with expiration time/date
                    return Card(
                      color: expired
                          ? Theme.of(context).colorScheme.error
                          : closed
                              ? Theme.of(context).disabledColor
                              : Theme.of(context).canvasColor,
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
                              status,
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                tooltip,
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              )
          ),
        )
      ],
    );
  }
}
