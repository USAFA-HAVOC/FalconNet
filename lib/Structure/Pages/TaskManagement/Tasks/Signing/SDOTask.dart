import 'dart:async';

import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Signing/UnitSigningEvent.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Database/UnitData.dart';
import '../../../../../Model/Store/Endpoints.dart';
import '../../../../../Utility/ErrorFormatting.dart';

class SDOTask extends StatelessWidget {
  const SDOTask({super.key});

  @override
  Widget build(BuildContext context) => UnitSigningEvent(
      retrieve: () => Endpoints.getOwnUnit(null),
      refresh: 10,
      label: "SDO",
      statusLabel: "Inspections",
      event: null,
  );
}