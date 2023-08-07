import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Store/Actions/GlobalAction.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
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
    if (type == FailureType.failed) {
      return Container(
          decoration: BoxDecoration(color: Theme
              .of(context)
              .canvasColor),
          child: StoreConnector<GlobalState, ViewModel<void>>(
              converter: (store) => ViewModel(store: store, content: null),
              builder: (context, model) =>
                  RefreshIndicator(
                      onRefresh: () async {
                        await model.dispatch(GlobalAction.initialize());
                      },
                      child: ListView(
                        clipBehavior: Clip.none,
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.2
                        ),
                        children: [
                          Icon(
                            Icons.wifi_off,
                            size: MediaQuery.of(context).size.width * 0.5,
                          ),

                          Text(
                            "Unable to connect to server. Please verify internet "
                                "connection. Pull down to refresh.",
                            style: Theme.of(context).textTheme.titleSmall,
                            textAlign: TextAlign.center,
                          )
                        ],
                      )
                  )
          )
      );
    }

    else {
      return Container(
        decoration: BoxDecoration(color: Theme.of(context).canvasColor),
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.2,
            left: 20,
            right: 20
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline_rounded,
                size: MediaQuery.of(context).size.width * 0.5,
              ),

              Text(
                "An internal error has occurred. Please try restarting the app."
                    " Otherwise, contact support.",
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              )
            ],
          ),
        )
      );
    }
  }
}