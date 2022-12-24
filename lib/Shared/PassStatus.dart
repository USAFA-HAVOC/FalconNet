import 'package:falcon_net/Shared/TemporalFormatting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../Model/GlobalState.dart';
import '../Model/Pass.dart';

class PassStatus extends StatelessWidget {
  const PassStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
              child: StoreBuilder<GlobalState>(
                  builder: (context, store) {
                    if (store.state.pass == null) {
                      return Card(
                          color: Theme.of(context).focusColor,
                          child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      "Pass Status",
                                      style: Theme.of(context).textTheme.headlineMedium,
                                    ),
                                  ),
                                  Text(
                                    "Passes are Open",
                                    style: Theme.of(context).textTheme.headlineLarge,
                                  ),
                                ],
                              ),
                          )
                      );
                    }
                    else {
                      Pass pass = store.state.pass!;
                      String expiration;
                      if (pass.end!.difference(DateTime.now()).compareTo(Duration(hours: 24)) < 0 && pass.end!.weekday == DateTime.now().weekday) {
                        expiration = "Expires: ${describeTime(TimeOfDay.fromDateTime(pass.end!))}";
                      }
                      else if (pass.end!.difference(DateTime.now()).compareTo(Duration(days: 7)) < 0) {
                        expiration = "Expires: ${formatWeekday(pass.end!.weekday)}, ${describeTime(TimeOfDay.fromDateTime(pass.end!))}";
                      }
                      else {
                        expiration = "Expires: ${describeDate(pass.end!)}, ${describeTime(TimeOfDay.fromDateTime(pass.end!))}";
                      }

                      return Card(
                          color: Theme.of(context).canvasColor,
                          child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      "Pass Status",
                                      style: TextStyle(
                                        fontSize: Theme.of(context).textTheme.headlineMedium!.fontSize,
                                        color: Colors.black
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Signed-Out",
                                    style: TextStyle(
                                        fontSize: Theme.of(context).textTheme.headlineLarge!.fontSize,
                                        color: Colors.black
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      expiration,
                                      style: TextStyle(
                                          fontSize: Theme.of(context).textTheme.headlineMedium!.fontSize,
                                          color: Colors.black
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                          ),
                      );
                    }
                  }
              ),
          )
        ],
      ),
    );
  }
}