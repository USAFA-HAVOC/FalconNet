import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Data/PassAllocation.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:flutter/material.dart';

import '../../../Model/Store/GlobalState.dart';

///Page Widget for displaying pass allotment information
class AllotmentWidget extends StatelessWidget {
  final String title;

  const AllotmentWidget({super.key, this.title = "Pass Allotment"});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalState, ViewModel<PassAllocation?>>(
        converter: (store) => ViewModel<PassAllocation?>(store: store, content: store.state.allocation),
        builder: (context, model) {
          return PageWidget(
              title: title,
              children: [
                Text(
                  "Weekday Day Passes: ${model.content?.weekdayDay ?? "Unlimited"}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),

                Text(
                  "Weekend Overnight Passes: ${model.content?.weekendOvernight ?? "Unlimited"}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),

                Text(
                  "Weekday Overnight Passes: ${model.content?.weekdayOvernight ?? "Unlimited"}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
          );
        }
    );
  }
}