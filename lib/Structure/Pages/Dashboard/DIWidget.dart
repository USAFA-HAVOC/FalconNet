import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../Model/Store/GlobalState.dart';
import '../../../Model/Store/StateAction.dart';

///Page widget for displaying DI information with signing ui
class DIWidget extends StatelessWidget {
  final String title;

  const DIWidget({super.key, this.title = "Dormitory Inspection"});

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<GlobalState>(
        builder: (context, store) {
          GlobalState state = store.state;

          //Replace these three with state queries/function calls--NOT API CALLS--once we have the time to do so
          bool senior = true;
          bool time = true;
          bool signed = state.di == null;

          bool signable = signed && senior && time;

          //Determine text based on state values
          List<Widget> text;
          if (signable) {
            text = [Text(
              "DI is Open",
              style: Theme.of(context).textTheme.headlineMedium,
            )];
          }
          else if (!senior) {
            text = [Text(
              "Cannot Sign Own DI",
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
                color: Colors.black,
              ),
            )];
          }
          else if (!time) {
            text = [Text(
              "DI Opens at 19:50",
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
                color: Colors.black,
              ),
            )];
          }
          else {
            text = [Text(
              "DI Signed by ${state.di!.signature}",
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
                color: Colors.black,
              ),
            )];
          }

          //Sets content to card with info text
          List<Widget> content = [
            Card(
                color: signable ? Theme.of(context).focusColor : Theme.of(context).canvasColor,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: text,
                  ),
                )
            ),
          ];

          //If signable, add button to sign di
          if (signable) {
            content.add(
              ElevatedButton(

                //Dispatch sign di action
                onPressed: () {
                  store.dispatch(StateAction.signDI());
                },

                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: const Text('Sign'),
                ),
              ),
            );
          }

          //Return Page Widget with given content
          return PageWidget(
              title: title,
              children: content
          );
        }
    );
  }
}