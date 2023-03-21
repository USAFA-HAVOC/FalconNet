import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/CadetLeave.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';

import '../../../Model/Store/Actions/LeaveAction.dart';
import '../../../Theme/NegativeButtonTheme.dart';
import '../../Components/PaddedColumn.dart';
import '../../Components/ViewModel.dart';
import 'LeaveLocatorForm.dart';

///Displays leave information and allows user to clear or update
class LeaveInfo extends StatelessWidget {
  const LeaveInfo({super.key});

  String describeTransport(CadetLeaveTransportMethod method) {
    switch (method.transport_type) {
      case "vehicle": {
        var type = method.vehicle_type;
        if (type == "Uber/Lyft") {
          return "Using rideshare service.";
        }
        else {
          return "Driven by ${method.vehicle_driver_name} in ${method.vehicle_type} for ${method.vehicle_travel_time_hours!.toStringAsFixed(1)} hours";
        }
      }
      case "airline": {
        var departure = method.airline_flight_departure_time!;
        var arrival = method.airline_flight_arrival_time!;
        return "Flying with ${method.airline_name} on flight #${method.airline_flight_number}. "
            "Departing at ${describeTime(TimeOfDay.fromDateTime(departure))} on ${describeDate(departure)}. "
            "Arriving at ${describeTime(TimeOfDay.fromDateTime(arrival))} on ${describeDate(arrival)}. ";
      }
      case "other": {
        return "Other: ${method.other_info!}";
      }
      default: return "Error: cannot read transport type";
    }
  }

  @override
  Widget build(BuildContext context) {
    var messenger = ScaffoldMessenger.of(context);
    return StoreConnector<GlobalState, ViewModel<CadetLeave?>>(
        converter: (store) => ViewModel(store: store, content: store.state.user.accountability!.current_leave?.toLocal()),
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
                padding: const EdgeInsets.symmetric(vertical: 2),
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

              const Divider(thickness: 1,),

              Text(
                "Departure",
                style: Theme.of(context).textTheme.titleSmall,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  describeTransport(leave.departure_method),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),

              const Divider(thickness: 1,),

              Text(
                "Return",
                style: Theme.of(context).textTheme.titleSmall,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  describeTransport(leave.return_method),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
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
                                          padding: const EdgeInsets.all(10),
                                          child: LeaveLocatorForm(
                                            editing: leave,
                                            dialog: true,
                                          ),
                                        )
                                      ],
                                    )
                                )
                            );
                          },

                          child: Text(
                            'Edit Leave',
                            style: Theme.of(context).textTheme.labelLarge,
                          )
                        ),
                      )
                  ),

                  const Spacer(flex: 1),

                  Expanded(
                    flex: 5,
                    child: ElevatedButton(
                      style: Theme.of(context).extension<NegativeButtonTheme>()!.style,

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

                      child: Text(
                        'Clear Data',
                        style: Theme.of(context).textTheme.labelLarge,
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