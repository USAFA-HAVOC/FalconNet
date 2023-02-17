import 'package:async_redux/async_redux.dart';
import 'package:built_collection/src/list.dart';
import 'package:falcon_net/Model/Database/CadetAccountability.dart';
import 'package:falcon_net/Model/Database/CadetPassAllocation.dart';
import 'package:falcon_net/Model/Database/User.dart';
import 'package:falcon_net/Model/Database/UserNotification.dart';
import 'package:falcon_net/Model/Database/UserPersonalInfo.dart';
import 'package:falcon_net/Model/Store/Actions/GlobalAction.dart';
import 'package:falcon_net/Model/Store/Endpoints.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';
import 'package:falcon_net/Theme/Dark/DarkTheme.dart';
import 'package:falcon_net/Theme/Light/LightTheme.dart';
import 'package:falcon_net/Theme/Random/RandomTheme.dart';
import 'package:flutter/material.dart';

import 'Model/Database/UserSettings.dart';
import 'Router/FNRouter.dart';
import 'Structure/Components/ViewModel.dart';

import 'dart:html' as html;

void main() {

  //Initialize a default store
  //Replace the default global state with an api call
  final store = Store<GlobalState>(
      initialState: GlobalState((b1) => b1
          ..user = User((b2) => b2
              ..id = ""
              ..personal_info = UserPersonalInfo((b3) => b3
                  ..full_name = "Ethan Chapman"
                  ..email = "C26Ethan.Chapman@afacademy.af.edu"
                  ..phone_number = "3037461308"
                  ..room_number = "Vandy 6D6"
                  ..squadron = 18
                  ..group = "CG02"
                  ..unit = "CS18"
              ).toBuilder()
              ..pass_allocation = CadetPassAllocation((b3) => b3
                  ..individual_pass_status = "OPEN"
                  ..effective_pass_status = "OPEN"
                  ..weekday_day_passes = 0
                  ..weekday_overnight_passes = 0
                  ..weekend_overnight_passes = 0
              ).toBuilder()
              ..accountability = CadetAccountability((b3) => b3
                  ..di_last_signed = DateTime.now().toUtc()
                  ..di_signed_by = ""
              ).toBuilder()
          ).toBuilder()
          ..notifications = ListBuilder<UserNotification>([])
          ..settings = UserSettings((b2) => b2
              ..theme = "light"
              ..taskPush = true
              ..diPush = true
              ..passPush = true
              ..pushNotifications = true
          ).toBuilder()
      )
  );

  if (!APIData.authenticated) {
    String s = html.window.location.toString();
    if (s.contains("code=")) {
      html.window.history.pushState(null, 'FalconNet', '');
      String token = s.split("code=").last;
      login(token);
      store.dispatch(GlobalAction.initialize());
    }
    else {
      html.window.open('https://api.ethanchapman.dev/', "_self");
    }
  }

  runApp(FNApp(store: store));
}

class FNApp extends StatelessWidget {
  final Store<GlobalState> store;

  const FNApp({super.key, required this.store});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Surrounds the app with a store provider so all child widgets can access global state
    return StoreProvider(
      store: store,
      child: StoreConnector<GlobalState, ViewModel<String>>(
        converter: (store) => ViewModel(store: store, content: store.state.settings.theme),
        builder: (context, model) => MaterialApp.router(
          theme: model.content == "light" ? lightTheme : (model.content == "dark" ? darkTheme : randomTheme),
          routerConfig: fnRouter,
        ),
      ),
    );
  }
}