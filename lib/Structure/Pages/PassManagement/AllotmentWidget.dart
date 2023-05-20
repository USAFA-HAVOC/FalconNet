import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/CadetAccountability.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:flutter/material.dart';

///Page Widget for displaying pass allotment information
class AllotmentWidget extends StatelessWidget {
  final String title;

  const AllotmentWidget({super.key, this.title = "Passes Remaining"});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalState, ViewModel<CadetAccountability>>(
        converter: (store) => ViewModel<CadetAccountability>(store: store, content: store.state.user.accountability!),
        builder: (context, model) {
          return PageWidget(
              title: title,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        (model.content.weekday_day_passes == null) ? "Unlimited" : model.content.weekday_day_passes.toString(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),

                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "Day Passes:",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    )
                  ],
                ),


                Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        (model.content.weekend_overnight_passes == null) ? "Unlimited" : model.content.weekend_overnight_passes.toString(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),

                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "Weekend Passes:",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    )
                  ],
                ),

                Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        (model.content.weekday_overnight_passes == null) ? "Unlimited" : model.content.weekday_overnight_passes.toString(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),

                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "Weekday Overnight Passes:",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    )
                  ],
                ),
              ],
          );
        }
    );
  }
}