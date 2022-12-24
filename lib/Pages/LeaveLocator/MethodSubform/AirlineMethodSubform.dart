import 'package:falcon_net/Pages/LeaveLocator/MethodSubform/LeaveMethodSubform.dart';
import 'package:falcon_net/Shared/TemporalFormatting.dart';
import 'package:flutter/material.dart';

import '../../../Model/Leave.dart';
import '../../../Shared/DateFormField.dart';
import '../../../Shared/TimeFormField.dart';

class AirlineMethodSubform extends StatefulWidget {
  final SubformController<LeaveMethod> controller;
  final LeaveMethodSubformType type;

  const AirlineMethodSubform({super.key, required this.type, required this.controller});

  @override
  State<AirlineMethodSubform> createState() => AirlineMethodSubformState();
}

class AirlineMethodSubformState extends State<AirlineMethodSubform> implements SpecificMethodSubform {
  late TextEditingController airline;
  late TextEditingController number;
  late TextEditingController depDate;
  late TextEditingController depTime;
  late TextEditingController arrDate;
  late TextEditingController arrTime;

  @override
  void initState() {
    if (widget.controller.value != null && widget.controller.value is AirlineMethod) {

      AirlineMethod operant = widget.controller.value! as AirlineMethod;
      airline = TextEditingController(text: operant.airline);
      number = TextEditingController(text: operant.flightNumber);
      depDate = TextEditingController(text: describeDate(operant.flightDepartureTime));
      arrDate = TextEditingController(text: describeDate(operant.flightArrivalTime));
      depTime = TextEditingController(text: describeTime(timeOf(operant.flightDepartureTime)));
      arrTime = TextEditingController(text: describeTime(timeOf(operant.flightArrivalTime)));
    }
    else {
      airline = TextEditingController();
      number = TextEditingController();
      depDate = TextEditingController(text: describeDate(DateTime.now()));
      arrDate = TextEditingController(text: describeDate(DateTime.now()));
      depTime = TextEditingController(text: describeTime(TimeOfDay.now()));
      arrTime = TextEditingController(text: describeTime(TimeOfDay.now()));
    }
    widget.controller.retrieve = buildLeaveMethod;
  }
  
  @override
  AirlineMethod buildLeaveMethod() {
    var fDepTime = parseTime(depTime.text);
    var fDepDate = parseDate(depDate.text);
    var flightDepartureTime = combineDate(fDepDate, fDepTime);
    var fArrTime = parseTime(arrTime.text);
    var fArrDate = parseDate(arrDate.text);
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
                validator: (content) {
                  if (content != null) {
                    if (content.isNotEmpty) {
                      return null;
                    }
                  }
                  return "Please enter an airline";
                },
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 5,
              child: TextFormField(
                controller: number,
                decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.bodyLarge,
                    labelText: "Flight Number"
                ),
                style: Theme.of(context).textTheme.bodyLarge,
                validator: (content) {
                  if (content != null) {
                    if (content.isNotEmpty) {
                      return null;
                    }
                  }
                  return "Please enter a flight number";
                },
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 4,
              child: DateFormField(
                controller: depDate,
                label: "Takeoff Date",
                validator: (content) {
                  if (content != null) {
                    if (content.isNotEmpty) {
                      return null;
                    }
                  }
                  return "Please enter a date";
                },
              ),
            ),
            Spacer(flex: 1),
            Expanded(
              flex: 4,
              child: TimeFormField(
                controller: depTime,
                label: "Takeoff Time",
                validator: (content) {
                  if (content != null) {
                    if (content.isNotEmpty) {
                      TimeOfDay time = parseTime(depTime.text);
                      DateTime date = parseDate(depDate.text);
                      DateTime givenDate = DateTime(date.year, date.month, date.day, time.hour, time.minute);
                      DateTime present = DateTime.now();
                      if (givenDate.compareTo(present) < 1) {
                        return "Time in past";
                      }
                      return null;
                    }
                  }
                  return "Please enter a time";
                },
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 4,
              child: DateFormField(
                controller: arrDate,
                label: "Landing Date",
                validator: (content) {
                  if (content != null) {
                    if (content.isNotEmpty) {
                      return null;
                    }
                  }
                  return "Please enter a date";
                },
              ),
            ),
            Spacer(flex: 1),
            Expanded(
              flex: 4,
              child: TimeFormField(
                controller: arrTime,
                label: "Landing Time",
                validator: (content) {
                  if (content != null) {
                    if (content.isNotEmpty) {
                      TimeOfDay time = parseTime(arrTime.text);
                      DateTime date = parseDate(arrDate.text);
                      DateTime givenDate = DateTime(date.year, date.month, date.day, time.hour, time.minute);
                      DateTime present = DateTime.now();
                      if (givenDate.compareTo(present) < 1) {
                        return "Time in past";
                      }
                      return null;
                    }
                  }
                  return "Please enter a time";
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}