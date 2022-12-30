import 'package:falcon_net/Structure/Components/PassWidget.dart';
import 'package:flutter/material.dart';

import 'DIWidget.dart';

///Home page containing commonly used widgets
class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                      "Dashboard",
                      style: Theme.of(context).textTheme.titleLarge
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: PassWidget(),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: DIWidget(),
                )
              ],
            )
        )
      ],
    );
  }
}