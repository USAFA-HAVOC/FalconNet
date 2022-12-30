import 'package:falcon_net/Utility/InputValidation.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';
import '../../../../Model/Data/Leave.dart';
import '../../../Components/DateFormField.dart';
import '../../../Components/TimeFormField.dart';
import 'LeaveMethodSubform.dart';

///Subform for the airline method
class AirlineMethodSubform extends StatefulWidget {

  //Controller for passing values back to form
  final SubformController<LeaveMethod> controller;
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

    //Uses existing values if provided
    if (widget.controller.value != null && widget.controller.value is AirlineMethod) {
      AirlineMethod operant = widget.controller.value! as AirlineMethod;
      airline = TextEditingController(text: operant.airline);
      number = TextEditingController(text: operant.flightNumber);
      depDate = describeDate(operant.flightDepartureTime);
      arrDate = describeDate(operant.flightArrivalTime);
      depTime = describeTime(timeOf(operant.flightDepartureTime));
      arrTime = describeTime(timeOf(operant.flightArrivalTime));
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
  AirlineMethod buildLeaveMethod() {
    var fDepTime = parseTime(depTime);
    var fDepDate = parseDate(depDate);
    var flightDepartureTime = combineDate(fDepDate, fDepTime);
    var fArrTime = parseTime(arrTime);
    var fArrDate = parseDate(arrDate);
    var flightArrivalTime = combineDate(fArrDate, fArrTime);
    return AirlineMethod(
        airline: airline.text,
        flightNumber: number.text,
        flightArrivalTime: flightArrivalTime,
        flightDepartureTime: flightDepartureTime
    );
  }

  @override
  Widget build(BuildContext context) {
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
                validator: InputValidation.stringLength(length: 0, emptyMessage: "Please enter an airline"),
              ),
            ),

            Spacer(flex: 1,),

            Expanded(
              flex: 5,
              child: TextFormField(
                controller: number,
                decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.bodyLarge,
                    labelText: "Flight Number"
                ),
                style: Theme.of(context).textTheme.bodyLarge,
                validator: InputValidation.stringLength(length: 0, emptyMessage: "Please enter a flight number"),
              ),
            ),

          ],
        ),

        Row(
          children: [
            Expanded(
              flex: 4,
              child: DateFormField(
                value: depDate,
                label: "Takeoff Date",
                validator: InputValidation.date(),
                onChanged: (change) => setState(() {
                  depDate = change;
                }),
              ),
            ),

            Spacer(flex: 1),

            Expanded(
              flex: 4,
              child: TimeFormField(
                value: depTime,
                label: "Takeoff Time",
                validator: InputValidation.time(date: parseDate(depDate)),
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
                value: arrDate,
                label: "Landing Date",
                validator: InputValidation.date(),
                onChanged: (change) => setState(() {
                  arrDate = change;
                }),
              ),
            ),

            Spacer(flex: 1),

            Expanded(
              flex: 4,
              child: TimeFormField(
                value: arrTime,
                label: "Landing Time",
                validator: InputValidation.time(date: parseDate(arrDate)),
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