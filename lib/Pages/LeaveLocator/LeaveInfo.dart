import 'package:falcon_net/Model/GlobalState.dart';
import 'package:falcon_net/Model/StateAction.dart';
import 'package:falcon_net/Pages/LeaveLocator/LeaveLocatorForm.dart';
import 'package:falcon_net/Shared/TemporalFormatting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../Model/Leave.dart';
import '../../Shared/PaddedColumn.dart';

class LeaveInfo extends StatelessWidget {
  const LeaveInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<GlobalState>(
        builder: (context, store) {
          Leave leave = store.state.leave!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "General",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              PaddedColumn(
                padding: EdgeInsets.symmetric(vertical: 2),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Address: ${leave.finalAddress} ${leave.finalCity}, ${leave.finalState} ${leave.finalZip}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    "Departure: ${describeDate(leave.departureTime)} ${describeTime(timeOf(leave.departureTime))}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    "Return: ${describeDate(leave.returnTime)} ${describeTime(timeOf(leave.returnTime))}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Divider(thickness: 1,),
              Text(
                "Departure",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  leave.departureMethod.description(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Divider(thickness: 1,),
              Text(
                "Return",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  leave.returnMethod.description(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              StoreBuilder<GlobalState>(
                builder: (context, store) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        flex: 5,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                      child: ListView(
                                        primary: false,
                                        shrinkWrap: true,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                            child: LeaveLocatorForm(
                                                existing: store.state.leave,
                                                dialog: true,
                                            ),
                                          )
                                        ],
                                      )
                                  )
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: const Text('Edit Leave'),
                            ),
                          ),
                        )
                    ),
                    Spacer(flex: 1),
                    Expanded(
                      flex: 5,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith((states) => Colors.grey),
                        ),
                        onPressed: () {
                          store.dispatch(StateAction.clearLeave());
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: const Text('Clear Data'),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        }
    );
  }
}