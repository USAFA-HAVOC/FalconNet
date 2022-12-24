import 'package:falcon_net/Model/GlobalState.dart';
import 'package:falcon_net/Pages/Home/PassForm.dart';
import 'package:falcon_net/Pages/Home/PassManagement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../Shared/PaddedColumn.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedColumn(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      padding: EdgeInsets.only(bottom: 10),
      children: [
        Text(
          "Dashboard",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        PassManagement(),

      ],
    );
  }
}