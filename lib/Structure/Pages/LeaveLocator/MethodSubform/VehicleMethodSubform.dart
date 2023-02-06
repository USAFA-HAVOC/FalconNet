import 'package:falcon_net/Model/Database/CadetLeave.dart';
import 'package:falcon_net/Utility/InputValidation.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';

import 'LeaveMethodSubform.dart';

///Subform for vehicle method
///Animates form change when vehicle type is changed
class VehicleMethodSubform extends StatefulWidget {
  final SubformController<CadetLeaveTransportMethod> controller;
  final LeaveMethodSubformType type;

  const VehicleMethodSubform({super.key, required this.type, required this.controller});

  @override
  State<VehicleMethodSubform> createState() => VehicleMethodSubformState();
}

class VehicleMethodSubformState extends State<VehicleMethodSubform> with SingleTickerProviderStateMixin {
  late String vehicleType;
  late TextEditingController time;
  late TextEditingController name;

  //Animation controllers for time and name collapsible fields
  late final AnimationController animationController = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

  late final Animation<double> animation = CurvedAnimation(
    parent: animationController,
    curve: Curves.fastOutSlowIn,
  );

  ///Initializes controller values based on given leave method data
  @override
  void initState() {
    super.initState();
    if (widget.controller.value != null && widget.controller.value!.transport_type == "vehicle") {
      CadetLeaveTransportMethod method = widget.controller.value!;
      vehicleType = method.vehicle_type;
      time = TextEditingController(text: method.vehicle_travel_time_hours.toStringAsPrecision(1));
      name = TextEditingController(text: method.vehicle_driver_name);
    }
    else {
      vehicleType = "Select";
      time = TextEditingController();
      name = TextEditingController();
    }

    //Sets animation value to closed if field extension not required
    if (!requiresInfo(vehicleType)){
      animationController.value = 0;
    }

    //Initializes controller retrieval method to own build method
    widget.controller.retrieve = buildLeaveMethod;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  ///Builds menu based on vehicle types
  List<DropdownMenuItem<String>> buildTypeOptions() {
    List<String> options = ["Select"] + VehicleType.values.map((v) => v.description).toList();

    return options.map((key) => DropdownMenuItem<String>(
        value: key,
        child: Text(
            key,
            style: Theme.of(context).textTheme.bodyLarge
        )
    )
    ).toList();
  }

  ///Builds leave method based on field values
  CadetLeaveTransportMethod buildLeaveMethod() {
    if (requiresInfo(vehicleType)) {
      return CadetLeaveTransportMethod((b) => b
          ..transport_type = "vehicle"
          ..vehicle_driver_name = name.text
          ..vehicle_travel_time_hours = double.parse(time.text)
          ..vehicle_type = vehicleType
          ..other_info = ""
          ..airline_flight_arrival_time = DateTime(3000).toUtc()
          ..airline_flight_departure_time = DateTime(3001).toUtc()
          ..airline_flight_number = ""
          ..airline_name = ""
      );
    }
    else {
      return CadetLeaveTransportMethod((b) => b
          ..transport_type = "vehicle"
          ..vehicle_type = vehicleType
      );
    }
  }

  ///Determines whether a vehicle type (as a string) requires driver and time information
  bool requiresInfo(String type) {
    if (type == VehicleType.rideshare.description || type == "Select") {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          value: vehicleType,
          validator: InputValidation.dropdown(),
          onChanged: (change) {
            setState(() {

              //If selection doesn't require fields, close extension and set time and name to empty
              if (!requiresInfo(change!)) {
                animationController.animateTo(0);
                time.value = TextEditingValue.empty;
                name.value = TextEditingValue.empty;
              }

              //Otherwise, extend time and name fields
              else if (!requiresInfo(vehicleType)){
                animationController.animateTo(1.0);
              }

              //Set new vehicle type
              vehicleType = change;
            });
          },
          items: buildTypeOptions(),
        ),

        SizeTransition(
          sizeFactor: animation,
          child: Column(
            children: [
              TextFormField(
                controller: time,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.bodyLarge,
                    labelText: "Hours of Travel"
                ),
                style: Theme.of(context).textTheme.bodyLarge,

                //Only require validation if vehicle type requires the time
                validator: (content) {
                  if (requiresInfo(vehicleType)) {
                    return InputValidation.number()(content);
                  }
                },
              ),

              TextFormField(
                controller: name,
                decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.bodyLarge,
                    labelText: "Driver's Name"
                ),
                style: Theme.of(context).textTheme.bodyLarge,

                //Only require validation if vehicle type requires the name
                validator: (content) {
                  if (requiresInfo(vehicleType)) {
                    return InputValidation.stringLength(emptyMessage: "Please enter a name")(content);
                  }
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}