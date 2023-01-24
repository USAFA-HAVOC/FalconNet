import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/CadetPassAllocation.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:flutter/material.dart';

///Page Widget for displaying pass allotment information
class AllotmentWidget extends StatelessWidget {
  final String title;

  const AllotmentWidget({super.key, this.title = "Pass Allotment"});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalState, ViewModel<CadetPassAllocation?>>(
        converter: (store) => ViewModel<CadetPassAllocation?>(store: store, content: store.state.user.pass_allocation),
        builder: (context, model) {
          return PageWidget(
              title: title,
              children: [
                Text(
                  "Weekday Day Passes: ${model.content?.weekday_day_passes ?? "Unlimited"}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),

                Text(
                  "Weekend Overnight Passes: ${model.content?.weekend_overnight_passes ?? "Unlimited"}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),

                Text(
                  "Weekday Overnight Passes: ${model.content?.weekday_overnight_passes ?? "Unlimited"}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
          );
        }
    );
  }
}