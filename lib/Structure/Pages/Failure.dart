import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Store/Actions/GlobalAction.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:flutter/material.dart';

import '../Components/ViewModel.dart';

enum FailureType {
  failed,
  error
}

class Failure extends StatelessWidget {
  final FailureType type;

  const Failure({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PageWidget(
        title: type == FailureType.error ? "Error" : "Failed to Load",
        children: [
          Text(
            type == FailureType.error
                ? "An internal error has occurred. Please try restarting the app."
                  " If the issue persists, please contact support."
                : "Failed to load required data. Please verify internet connection "
                  "and try again",
            style: Theme.of(context).textTheme.bodyMedium,
          ),

          if (type == FailureType.failed) StoreConnector<GlobalState, ViewModel<void>>(
            converter: (store) => ViewModel(store: store, content: null),
            builder: (context, model) => ElevatedButton(
              onPressed: () async {
                await model.dispatch(GlobalAction.reset());
                model.dispatch(GlobalAction.initialize());
              },
              child: const Text("Attempt to Reload")
            )
          )
        ],
      ),
    );
  }
}