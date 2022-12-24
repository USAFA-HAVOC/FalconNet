import 'package:falcon_net/Pages/LeaveLocator/LeaveInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../Model/GlobalState.dart';
import 'LeaveLocatorForm.dart';

class LeaveLocator extends StatelessWidget {
  const LeaveLocator({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: false,
      shrinkWrap: true,
      children: [
        Text(
          "Leave Locator",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Card(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: StoreBuilder<GlobalState>(
              builder: (context, store) {
                if (store.state.leave == null) {
                  return LeaveLocatorForm(dialog: false,);
                }
                else {
                  return LeaveLocatorForm(dialog: false, existing: store.state.leave,);//LeaveInfo();
                }
              },
            )
          ),
        )
      ],
    );
  }
}