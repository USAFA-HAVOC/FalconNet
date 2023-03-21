import 'package:falcon_net/Model/Database/CadetLeave.dart';
import 'package:falcon_net/Utility/InputValidation.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';
import '../../../Components/DateFormField.dart';
import '../../../Components/TimeFormField.dart';
import 'LeaveMethodSubform.dart';

///Subform for the airline method
class AirlineMethodSubform extends StatefulWidget {

  //Controller for passing values back to form
  final SubformController<CadetLeaveTransportMethod> controller;
  final LeaveMethodSubformType type;

  const AirlineMethodSubform({super.key, required this.type, required this.controller});

  @override
  State<AirlineMethodSubform> createState() => AirlineMethodSubformState();
}

class AirlineMethodSubformState extends State<AirlineMethodSubform> {

  //Text controllers for each text field
  late TextEditingController airline;
  late TextEditingController number;
  late String depDate;
  late String depTime;
  late String arrDate;
  late String arrTime;

  ///Initializes controller values based on existing data and defaults
  @override
  void initState() {
    super.initState();

    //Uses existing values if provided
    if (widget.controller.value != null && widget.controller.value!.transport_type == "airline") {
      var method = widget.controller.value!;
      airline = TextEditingController(text: method.airline_name);
      number = TextEditingController(text: method.airline_flight_number);
      depDate = describeDate(method.airline_flight_departure_time!);
      arrDate = describeDate(method.airline_flight_arrival_time!);
      depTime = describeTime(timeOf(method.airline_flight_departure_time!));
      arrTime = describeTime(timeOf(method.airline_flight_arrival_time!));
    }

    //Otherwise populates with defaults
    else {
      airline = TextEditingController();
      number = TextEditingController();
      depDate = describeDate(DateTime.now());
      arrDate = describeDate(DateTime.now());
      depTime = describeTime(TimeOfDay.now());
      arrTime = describeTime(TimeOfDay.now());
    }

    //Sets controller retrieval function to own build method
    widget.controller.retrieve = buildLeaveMethod;
  }

  ///Builds leave method with field values
  ///Requires valid entries
  ///Should only be called after successful validate function
  CadetLeaveTransportMethod buildLeaveMethod() {
    var fDepTime = parseTime(depTime);
    var fDepDate = parseDate(depDate);
    var flightDepartureTime = combineDate(fDepDate, fDepTime);
    var fArrTime = parseTime(arrTime);
    var fArrDate = parseDate(arrDate);
    var flightArrivalTime = combineDate(fArrDate, fArrTime);
    return CadetLeaveTransportMethod((b) => b
        ..transport_type = "airline"
        ..airline_flight_departure_time = flightDepartureTime
        ..airline_flight_arrival_time = flightArrivalTime
        ..airline_flight_number = number.text
        ..airline_name = airline.text
        ..other_info = null
        ..vehicle_driver_name = null
        ..vehicle_travel_time_hours = null
        ..vehicle_type = null
    );
  }

  @override
  Widget build(BuildContext context) {
    bool inactive = LeaveMethodSelection.of(context).type != "airline";

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 5,
              child: TextFormField(
                controller: airline,
                decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.bodyLarge,
                    labelText: "Airline"
                ),
                style: Theme.of(context).textTheme.bodyLarge,
                validator: InputValidation.override(
                    InputValidation.stringLength(length: 0, emptyMessage: "Please enter an airline"),
                    inactive
                ),
              ),
            ),

            const Spacer(flex: 1,),

            Expanded(
              flex: 5,
              child: TextFormField(
                controller: number,
                decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.bodyLarge,
                    labelText: "Flight Number"
                ),
                style: Theme.of(context).textTheme.bodyLarge,
                validator: InputValidation.override(
                    InputValidation.stringLength(length: 0, emptyMessage: "Please enter a flight number"),
                    inactive
                ),
              ),
            ),

          ],
        ),

        Row(
          children: [
            Expanded(
              flex: 4,
              child: DateFormField(
                firstDate: DateTime.now().subtract(const Duration(days: 30)),
                value: depDate,
                label: "Takeoff Date",
                validator: InputValidation.override(
                    InputValidation.date(),
                    inactive
                ),
                onChanged: (change) => setState(() {
                  depDate = change;
                  if (!parseDate(depDate).isBefore(parseDate(arrDate))) {
                    arrDate = change;
                  }
                }),
              ),
            ),

            const Spacer(flex: 1),

            Expanded(
              flex: 4,
              child: TimeFormField(
                value: depTime,
                label: "Takeoff Time",
                validator: InputValidation.override(
                    InputValidation.time(date: parseDate(depDate)),
                    inactive
                ),
                onChanged: (change) => setState(() {
                  depTime = change;
                }),
              ),
            ),
          ],
        ),

        Row(
          children: [
            Expanded(
              flex: 4,
              child: DateFormField(
                firstDate: parseDate(depDate),
                value: arrDate,
                label: "Landing Date",
                validator: InputValidation.override(
                    InputValidation.date(),
                    inactive
                ),
                onChanged: (change) => setState(() {
                  arrDate = change;
                }),
              ),
            ),

            const Spacer(flex: 1),

            Expanded(
              flex: 4,
              child: TimeFormField(
                value: arrTime,
                label: "Landing Time",
                validator: InputValidation.override(
                    InputValidation.time(date: parseDate(arrDate)),
                    inactive
                ),
                onChanged: (change) => setState(() {
                  arrTime = change;
                }),
              ),
            ),
          ],
        ),
      ],
    );
  }
}