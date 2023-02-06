import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/CadetLeave.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';

import '../../../Model/Store/Actions/LeaveAction.dart';
import '../../Components/PaddedColumn.dart';
import '../../Components/ViewModel.dart';
import 'LeaveLocatorForm.dart';

///Displays leave information and allows user to clear or update
class LeaveInfo extends StatelessWidget {
  const LeaveInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var messenger = ScaffoldMessenger.of(context);
    return StoreConnector<GlobalState, ViewModel<CadetLeave?>>(
        converter: (store) => ViewModel(store: store, content: store.state.leave),
        builder: (context, model) {
          CadetLeave leave = model.content!;
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
                    "Address: ${leave.final_address} ${leave.final_city}, ${leave.final_state} ${leave.final_zip}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  Text(
                    "Emergency Contact: ${leave.emergency_contact_name} ${leave.emergency_contact_phone}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  Text(
                    "Departure: ${describeDate(leave.departure_time)} ${describeTime(timeOf(leave.departure_time))}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  Text(
                    "Return: ${describeDate(leave.return_time)} ${describeTime(timeOf(leave.return_time))}",
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
                  leave.departure_method.transport_type,
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
                  leave.return_method.transport_type,
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
                        model.dispatch(LeaveAction.clear(
                            onSucceed: () {
                              messenger.showSnackBar(const SnackBar(content: Text("Leave Data Cleared Successfully")));
                            },
                            onFail: () {
                              messenger.showSnackBar(const SnackBar(content: Text("Failed to Clear Leave Data")));
                            }
                        ));
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