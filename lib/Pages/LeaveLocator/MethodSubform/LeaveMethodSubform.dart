import 'package:flutter/material.dart';

import '../../../Model/Leave.dart';
import 'AirlineMethodSubform.dart';
import 'OtherMethodSubform.dart';
import 'VehicleMethodSubform.dart';

enum LeaveMethodSubformType {
  departure,
  arrival,
}

abstract class SpecificMethodSubform {
  LeaveMethod buildLeaveMethod();
}

class SubformController<T> {
  T? value;
  late T Function() retrieve;

  SubformController({this.value});
}

class LeaveMethodSubform extends StatefulWidget {
  final SubformController<LeaveMethod> controller;
  final LeaveMethodSubformType type;
  const LeaveMethodSubform({super.key, required this.type, required this.controller});

  @override
  State<LeaveMethodSubform> createState() => LeaveMethodSubformState();
}

class LeaveMethodSubformState extends State<LeaveMethodSubform> {
  late String method;
  late Widget oldChild;
  late Widget newChild;

  String describeMethod(TransportType transport) {
    switch (transport) {
      case TransportType.other: return "Other";
      case TransportType.vehicle: return "Vehicle";
      case TransportType.airline: return "Airline";
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.controller.value != null) {
      method = describeMethod(widget.controller.value!.type());
    }
    else {
      method = "Select";
    }
    oldChild = methodSubform(method);
    newChild = oldChild;
  }

  Widget methodSubform(String method) {
    switch (method) {
      case "Select": return SizedBox.fromSize(size: Size.fromHeight(0),);
      case "Airline": return AirlineMethodSubform(type: widget.type, controller: widget.controller,);
      case "Vehicle": return VehicleMethodSubform(type: widget.type, controller: widget.controller,);
      case "Other": return OtherMethodSubform(type: widget.type, controller: widget.controller,);
      default: return SizedBox(width: 0, height: 0);
    }
  }

  List<DropdownMenuItem<String>> buildTypeOptions() {
    List<String> options = <String>[
      "Select",
      "Airline",
      "Vehicle",
      "Other",
    ];

    return options.map((key) => DropdownMenuItem<String>(
        value: key,
        child: Text(
            key,
            style: Theme.of(context).textTheme.bodyLarge
        )
    )
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
            decoration: InputDecoration(
                labelStyle: Theme.of(context).textTheme.bodyLarge,
                labelText: widget.type == LeaveMethodSubformType.departure
                    ? "Departure Travel Method"
                    : "Arrival Travel Method",
            ),
            value: method,
            onChanged: (change) {
              setState(() {
                method = change!;
                oldChild = newChild;
                newChild = methodSubform(method);
              });
            },
            validator: (content) {
              if (content != null) {
                if (content != "Select") {
                  return null;
                }
              }
              return "Please enter travel method";
            },
            items: buildTypeOptions(),
        ),
        AnimatedCrossFade(
            firstChild: oldChild,
            secondChild: newChild,
            crossFadeState: CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 500),
        )
      ],
    );
  }
}