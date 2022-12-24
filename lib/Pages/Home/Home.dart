import 'package:falcon_net/Model/GlobalState.dart';
import 'package:falcon_net/Pages/Home/DIWidget.dart';
import 'package:falcon_net/Shared/PassForm.dart';
import 'package:falcon_net/Shared/PassWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../Shared/PaddedColumn.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: false,
      shrinkWrap: true,
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
    );
  }
}