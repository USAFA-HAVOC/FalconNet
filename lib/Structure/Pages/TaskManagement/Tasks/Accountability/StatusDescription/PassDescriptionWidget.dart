import 'package:falcon_net/Model/Database/PassType.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';

import '../../../../../../Model/Database/CadetPass.dart';


class PassDescriptionWidget extends StatelessWidget {
  final CadetPass pass;

  const PassDescriptionWidget({super.key, required this.pass});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Pass Type: ${pass.pass_type}"),

          Text("Description: ${pass.description}"),

          if (pass.pass_type == PassType.sca.name) Text("SCA: ${[pass.sca_number!]}"),

          Text("City: ${pass.city}"),

          Text("State: ${pass.state}"),

          Text("Start: ${describeDate(pass.start_time.toLocal())} ${describeTime(TimeOfDay.fromDateTime(pass.start_time.toLocal()))}"),

          Text("End: ${describeDate(pass.end_time.toLocal())} ${describeTime(TimeOfDay.fromDateTime(pass.end_time.toLocal()))}"),
        ],
      ),
    );
  }
}