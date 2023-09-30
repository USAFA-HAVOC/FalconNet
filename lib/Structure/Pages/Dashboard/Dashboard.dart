import 'package:falcon_net/Structure/Components/FNPage.dart';
import 'package:falcon_net/Structure/Components/PassWidget.dart';
import 'package:flutter/material.dart';

import 'DIWidget.dart';

///Home page containing commonly used widgets
class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const FNPage(
        title: "Dashboard",
        children: [
          PassWidget(),
          DIWidget(),
        ]
    );
  }
}