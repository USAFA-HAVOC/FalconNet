import 'package:falcon_net/Model/Database/CadetLeave.dart';
import 'package:falcon_net/Utility/InputValidation.dart';
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
    if (widget.controller.value != null && widget.controller.value!.transport_type == TransportType.vehicle.name) {
      CadetLeaveTransportMethod method = widget.controller.value!;
      vehicleType = method.vehicle_type!;
      time = TextEditingController(text: method.vehicle_travel_time_hours!.toStringAsFixed(1));
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
    else {
      animationController.value = 1;
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
          ..transport_type = TransportType.vehicle.name
          ..vehicle_driver_name = name.text
          ..vehicle_travel_time_hours = double.parse(time.text)
          ..vehicle_type = vehicleType
          ..other_info = null
          ..airline_flight_arrival_time = null
          ..airline_flight_departure_time = null
          ..airline_flight_number = null
          ..airline_name = null
      );
    }
    else {
      return CadetLeaveTransportMethod((b) => b
          ..transport_type = TransportType.vehicle.name
          ..vehicle_type = vehicleType
          ..vehicle_travel_time_hours = 0
          ..vehicle_driver_name = ""
          ..other_info = ""
          ..airline_flight_arrival_time = null
          ..airline_flight_departure_time = null
          ..airline_flight_number = ""
          ..airline_name = ""
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
    bool inactive = LeaveMethodSelection.of(context).type != TransportType.vehicle.name;

    return Column(
      children: [
        DropdownButtonFormField(
          isExpanded: true,
          value: vehicleType,
          validator: InputValidation.override(
              InputValidation.dropdown(),
              inactive,
          ),
          onChanged: (change) {
            setState(() {

              //If selection doesn't require fields, close extension and set time and name to empty
              if (!requiresInfo(change!)) {
                animationController.animateTo(0);
                time.value = TextEditingValue.empty;
                name.value = TextEditingValue.empty;
              }

              //Otherwise, extend time and name fields
              else if (!requiresInfo(vehicleType)) {
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
                keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: true),
                decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.bodyLarge,
                    labelText: "Hours of Travel"
                ),
                style: Theme.of(context).textTheme.bodyLarge,

                //Only require validation if vehicle type requires the time
                validator: InputValidation.override(
                  InputValidation.number(),
                  inactive || !requiresInfo(vehicleType),
                ),
              ),

              TextFormField(
                controller: name,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.bodyLarge,
                    labelText: "Driver's Name"
                ),
                style: Theme.of(context).textTheme.bodyLarge,

                //Only require validation if vehicle type requires the name
                validator: InputValidation.override(
                  InputValidation.stringLength(emptyMessage: "Please enter a name"),
                  inactive || !requiresInfo(vehicleType),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}