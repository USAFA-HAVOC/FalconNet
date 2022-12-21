import 'package:falcon_net/Model/GlobalState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../Shared/PaddedColumn.dart';

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
        Card(
          child: PaddedColumn(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            padding: EdgeInsets.all(10),
            children: [
              Text(
                  "Pass Management",
                  style: Theme.of(context).textTheme.titleMedium
              ),
              Row(
                children: [Expanded(child: Card(
                    color: Theme.of(context).focusColor,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Passes Are",
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ),
                          Text(
                            "Open",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ],
                      ),
                    )
                ))],
              ),
              ElevatedButton(
                onPressed: () => {
                  print("Open New Pass Dialog")
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("New Pass"),
                ),
              )
            ],
          ),
        )

      ],
    );
  }
}