import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../../Model/Data/Leave.dart';
import '../../../Model/Store/GlobalState.dart';
import 'LeaveInfo.dart';
import 'LeaveLocatorForm.dart';

///Leave locator page which displays either leave locator form or information
class LeaveLocator extends StatelessWidget {
  LeaveLocator({super.key});

  //Filled out leave data for testing purposes
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
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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

                      //Displays form if leave data is empty or info if it exists
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
          ),
        )
      ],
    );
  }
}