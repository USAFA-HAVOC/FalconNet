import 'package:falcon_net/Pages/LeaveLocator/MethodSubform/LeaveMethodSubform.dart';
import 'package:falcon_net/Shared/TemporalFormatting.dart';
import 'package:flutter/material.dart';

import '../../../Model/Leave.dart';
import '../../../Shared/DateFormField.dart';
import '../../../Shared/TimeFormField.dart';

class VehicleMethodSubform extends StatefulWidget {
  final SubformController<LeaveMethod> controller;
  final LeaveMethodSubformType type;

  const VehicleMethodSubform({super.key, required this.type, required this.controller});

  @override
  State<VehicleMethodSubform> createState() => VehicleMethodSubformState();
}

class VehicleMethodSubformState extends State<VehicleMethodSubform> with SingleTickerProviderStateMixin {
  late String vehicleType;
  late TextEditingController time;
  late TextEditingController name;

  late final AnimationController animationController = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

  late final Animation<double> animation = CurvedAnimation(
    parent: animationController,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    if (widget.controller.value != null && widget.controller.value is VehicleMethod) {
      VehicleMethod operant = widget.controller.value as VehicleMethod;
      vehicleType = operant.vehicleType.description;
      time = TextEditingController(text: operant.vehicleTravelTime?.toStringAsPrecision(1));
      name = TextEditingController(text: operant.vehicleDriverName);
    }
    else {
      vehicleType = "Select";
      time = TextEditingController();
      name = TextEditingController();
    }
    if (!requiresInfo(vehicleType)){
      animationController.value = 0;
    }
    widget.controller.retrieve = buildLeaveMethod;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

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

  VehicleMethod buildLeaveMethod() {
    if (requiresInfo(vehicleType)) {
      return VehicleMethod(
        vehicleDriverName: name.text,
        vehicleTravelTime: double.parse(time.text),
        vehicleType: VehicleNames.parse(vehicleType),
      );
    }
    else {
      return VehicleMethod(
        vehicleType: VehicleNames.parse(vehicleType),
      );
    }
  }

  bool requiresInfo(String type) {
    if (type == VehicleType.uber.description || type == "Select") {
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
          onChanged: (change) {
            setState(() {
              if (!requiresInfo(change!)) {
                animationController.animateTo(0);
                time.value = TextEditingValue.empty;
                name.value = TextEditingValue.empty;
              }
              else if (!requiresInfo(vehicleType)){
                animationController.animateTo(1.0);
              }
              vehicleType = change!;
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
                validator: (content) {
                  if (requiresInfo(vehicleType)) {
                    if (content != null) {
                      if (content.isNotEmpty) {
                        if (double.tryParse(content) != null) {
                          return null;
                        }
                      }
                    }
                    return "Please enter a number";
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
                validator: (content) {
                  if (requiresInfo(vehicleType)) {
                    if (content != null) {
                      if (content.isNotEmpty) {
                        return null;
                      }
                    }
                    return "Please enter a name";
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