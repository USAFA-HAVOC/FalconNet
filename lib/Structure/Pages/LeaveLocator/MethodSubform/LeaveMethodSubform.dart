import 'package:falcon_net/Utility/InputValidation.dart';
import 'package:flutter/material.dart';
import '../../../../Model/Data/Leave.dart';
import 'AirlineMethodSubform.dart';
import 'OtherMethodSubform.dart';
import 'VehicleMethodSubform.dart';

enum LeaveMethodSubformType {
  departure,
  arrival,
}

///Controller for retrieving subform values
class SubformController<T> {
  T? value;
  late T Function() retrieve;

  SubformController({this.value});
}

///Subform for a leave method, either arrival or departure
///Consists of a dropdown menu for a method type and another
///subform determined by the selected method type
class LeaveMethodSubform extends StatefulWidget {
  final SubformController<LeaveMethod> controller;
  final LeaveMethodSubformType type;
  const LeaveMethodSubform({super.key, required this.type, required this.controller});

  @override
  State<LeaveMethodSubform> createState() => LeaveMethodSubformState();
}

class LeaveMethodSubformState extends State<LeaveMethodSubform> {
  late String method;

  //Widgets for containing widgets for crossfade transition
  late Widget oldChild;
  late Widget newChild;

  String describeMethod(TransportType transport) {
    switch (transport) {
      case TransportType.other: return "Other";
      case TransportType.vehicle: return "Vehicle";
      case TransportType.airline: return "Airline";
    }
  }

  ///Initializes controller values from given leave method data
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

  ///Determines specific method subform
  Widget methodSubform(String method) {
    switch (method) {
      case "Select": return SizedBox.fromSize(size: Size.fromHeight(0),);
      case "Airline": return AirlineMethodSubform(type: widget.type, controller: widget.controller,);
      case "Vehicle": return VehicleMethodSubform(type: widget.type, controller: widget.controller,);
      case "Other": return OtherMethodSubform(type: widget.type, controller: widget.controller,);
      default: return SizedBox(width: 0, height: 0);
    }
  }

  ///Builds options for method types
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

            //Switches out submenu children
            onChanged: (change) {
              setState(() {
                method = change!;
                oldChild = newChild;
                newChild = methodSubform(method);
              });
            },

            validator: InputValidation.dropdown(),
            items: buildTypeOptions(),
        ),

        //Animates a cross fade between subform children
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