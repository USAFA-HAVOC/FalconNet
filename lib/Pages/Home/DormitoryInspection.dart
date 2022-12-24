import 'package:falcon_net/Model/StateAction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../Model/GlobalState.dart';

class DormitoryInspection extends StatelessWidget {
  const DormitoryInspection({super.key});

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

          if (signable) {
            content.add(
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () {
                    store.dispatch(StateAction.signDI());
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: const Text('Sign'),
                  ),
                ),
              ),
            );
          }

          return Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: content,
                ),
              )
          );
        }
    );
  }
}