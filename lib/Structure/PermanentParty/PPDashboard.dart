import 'package:falcon_net/Model/Database/StringRequest.dart';
import 'package:falcon_net/Model/Database/UnitGrades.dart';
import 'package:falcon_net/Structure/Components/AsyncPage.dart';
import 'package:falcon_net/Structure/Components/GradeAveragesWidget.dart';
import 'package:falcon_net/Structure/Components/UnitStatusWidget.dart';
import 'package:flutter/material.dart';

import '../../Model/Database/UnitData.dart';
import '../../Model/Store/Endpoints.dart';

///Home page containing commonly used widgets
class PPDashboard extends StatefulWidget {
  const PPDashboard({super.key});

  @override
  State<StatefulWidget> createState() => PPDashboardState();
}

class PPDashboardData {
  final UnitData accountability;
  final UnitGrades grades;

  const PPDashboardData({required this.accountability, required this.grades});
}

class PPDashboardState extends State<PPDashboard> {
  late Future<PPDashboardData> connection;

  @override
  void initState() {
    super.initState();
    connection = buildConnection();
  }

  Future<PPDashboardData> buildConnection() async {
    var unit = await Endpoints.getOwnUnit(null);
    var grades = await Endpoints.unitGrades(StringRequest((r) => r..string = unit.unit.name));
    return PPDashboardData(accountability: unit, grades: grades);
  }

  @override
  Widget build(BuildContext context) {
    return AsyncPage(
        title: "Dashboard",
        connection: connection,
        builder: (context, data) => [
          UnitStatusWidget(data: data.accountability, label: "Current Accountability"),
          
          GradeAveragesWidget.unit(unit: data.grades, label: "Unit Grades",)
        ]
    );
  }
}