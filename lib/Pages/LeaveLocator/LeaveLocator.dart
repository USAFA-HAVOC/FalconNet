import 'package:falcon_net/Pages/LeaveLocator/LeaveInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../Model/GlobalState.dart';
import '../../Model/Leave.dart';
import 'LeaveLocatorForm.dart';

class LeaveLocator extends StatelessWidget {
  LeaveLocator({super.key});


  final Leave? test = null;
  /*Leave? test = Leave(
    contactName: "Rylie Anderson",
    contactPhone: "(515) 782-5949",
    id: 'Fix',
    finalZip: '50035',
    finalState: 'Iowa',
    finalCity: 'Bondurant',
    finalAddress: '9701 NE 88th St.',
    departureTime: DateTime(2023, 12, 23, 19, 30),
    returnTime: DateTime(2024, 1, 7, 6, 50),
    departureMethod: AirlineMethod(
      airline: "United",
      flightNumber: "UA545",
      flightDepartureTime: DateTime(2023, 12, 23, 20, 30),
      flightArrivalTime: DateTime(2023, 12, 23, 22, 20),
    ),
    returnMethod: VehicleMethod(
      vehicleType: VehicleType.uber,
    ),
  );*/

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: false,
      shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Text(
              "Leave Locator",
              style: Theme.of(context).textTheme.titleLarge
          ),
        ),
        Card(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: StoreBuilder<GlobalState>(
              builder: (context, store) {
                if (store.state.leave == null) {
                  return LeaveLocatorForm(dialog: false, existing: test,);
                }
                else {
                  return LeaveInfo();
                }
              },
            )
          ),
        )
      ],
    );
  }
}