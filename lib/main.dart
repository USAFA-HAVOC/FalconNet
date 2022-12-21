import 'package:falcon_net/Model/GlobalState.dart';
import 'package:falcon_net/Model/Reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';

import 'Router/FNRouter.dart';
import 'Theme/FNTheme.dart';

void main() {
  final store = Store<GlobalState>(reducer, initialState: const GlobalState(name: "Rylie"));
  runApp(FalconNetApp(store: store));
}

class FalconNetApp extends StatelessWidget {
  final Store<GlobalState> store;

  const FalconNetApp({super.key, required this.store});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp.router(
          theme: fnTheme,
          routerConfig: fnRouter,
        )
    );
  }
}