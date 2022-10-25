import 'package:falconnet/api/api.dart';
import 'package:falconnet/api/models.dart';
import 'package:falconnet/features/dashboard/widgets/unit_member_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:built_collection/built_collection.dart';

import '../../../theme/src/app_text_styles.dart';
import '../widgets/unit_stats_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return DashboardPageState();
  }
}

class DashboardPageState extends State<DashboardPage> {
  CWOCViewData data = CWOCViewData((c) {c
    ..squadron = 0
    ..group = 0
    ..group_accountability_percent = 0
    ..squadron_accountability_percent = 0
    ..wing_accountability_percent = 0
    ..group_members = 0
    ..squadron_members = 0
    ..wing_members = 0
    ..unit = ""
    ..unit_members = ListBuilder();
  });

  bool loaded = false;

  DashboardPageState() : super();

  @override
  Widget build(BuildContext context) {
    if (!loaded) {
      Endpoints.cwoc.hit(null).then((value) {
        setState(() {
          data = value;
          loaded = true;
        });
      });
    }

    List<Widget> members = [];

    int i = 0;

    for (var c in data.unit_members) {
      members.add(
        Container(
          color: i++ % 2 == 0 ? const Color.fromARGB(30, 0, 0, 0) : Colors.white,
          child: UnitMemberWidget("${c.first_name} ${c.last_name}", c.room_num, c.accountability)
        )
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                UnitStatsWidget("Cadet Squadron ${data.squadron}", data.squadron_accountability_percent, data.squadron_members),
                UnitStatsWidget("Cadet Group ${data.group}", data.group_accountability_percent, data.group_members),
                UnitStatsWidget("Cadet Wing", data.wing_accountability_percent, data.wing_members)
              ],
            ),
            const SizedBox(width: 100),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 500,
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Text(
                      'Unit Members:',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.h2.copyWith(fontSize: 18),
                    ),
                    const UnitMemberWidgetHeading(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: members,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}