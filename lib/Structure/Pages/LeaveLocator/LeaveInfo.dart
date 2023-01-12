import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';

import '../../../../Model/Data/Leave.dart';
import '../../../Model/Store/Actions/LeaveAction.dart';
import '../../Components/PaddedColumn.dart';
import '../../Components/ViewModel.dart';
import 'LeaveLocatorForm.dart';

///Displays leave information and allows user to clear or update
class LeaveInfo extends StatelessWidget {
  const LeaveInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalState, ViewModel<Leave?>>(
        converter: (store) => ViewModel(store: store, content: store.state.leave),
        builder: (context, model) {
          Leave leave = model.content!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "General",
                style: Theme.of(context).textTheme.titleSmall,
              ),

              //Stack of destination information in a stack with labels
              PaddedColumn(
                padding: EdgeInsets.symmetric(vertical: 2),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Address: ${leave.finalAddress} ${leave.finalCity}, ${leave.finalState} ${leave.finalZip}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  Text(
                    "Emergency Contact: ${leave.contactName} ${leave.contactPhone}",
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: ElevatedButton(

                          //When pressed, display leave form in dialog with existing data
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
                                            existing: leave,
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

                      //Dispatch a clear leave action
                      onPressed: () {
                        model.dispatch(LeaveAction.clear());
                      },

                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: const Text('Clear Data'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
    );
  }
}