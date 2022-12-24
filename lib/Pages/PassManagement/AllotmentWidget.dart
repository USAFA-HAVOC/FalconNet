import 'package:falcon_net/Shared/PageWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../Model/GlobalState.dart';

class AllotmentWidget extends StatelessWidget {
  final String title;

  const AllotmentWidget({super.key, this.title = "Pass Allotment"});

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<GlobalState>(
        builder: (context, store) {
          return PageWidget(
              title: title,
              children: [
                Text(
                  "Weekday Day Passes: ${store.state.allocation.weekdayDay}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "Weekend Overnight Passes: ${store.state.allocation.weekendOvernight}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "Weekday Overnight Passes: ${store.state.allocation.weekdayOvernight}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
          );
        }
    );
  }
}