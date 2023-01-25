import 'package:async_redux/async_redux.dart';
import 'package:built_collection/src/list.dart';
import 'package:falcon_net/Model/Database/CadetDI.dart';
import 'package:falcon_net/Model/Database/CadetPassAllocation.dart';
import 'package:falcon_net/Model/Database/User.dart';
import 'package:falcon_net/Model/Database/UserNotification.dart';
import 'package:falcon_net/Model/Database/UserPersonalInfo.dart';
import 'package:falcon_net/Model/Store/Actions/FetchProfileInfoAction.dart';
import 'package:falcon_net/Model/Store/Actions/SettingsAction.dart';
import 'package:falcon_net/Model/Store/Connection/Connection.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'Model/Database/UserSettings.dart';
import 'Model/Store/Actions/NotificationAction.dart';
import 'Router/FNRouter.dart';
import 'Structure/Components/ViewModel.dart';
import 'Theme/Dark/DarkTheme.dart';
import 'Theme/Light/LightTheme.dart';

import 'dart:html' as html;

void main() async {

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
              ..di = CadetDI((b3) => b3
                  ..last_signed = DateTime.now().toUtc()
                  ..signed_by = ""
              ).toBuilder()
          ).toBuilder()
          ..notifications = ListBuilder<UserNotification>([])
          ..settings = UserSettings((b2) => b2
              ..darkTheme = false
              ..taskPush = true
              ..diPush = true
              ..passPush = true
              ..pushNotifications = true
          ).toBuilder()
      )
  );

  // store.dispatch(SettingsAction.retrieve());
  // store.dispatch(NotificationAction.retrieve());
  // store.dispatch(NotificationAction.add(UserNotification(message: "You logged in", destination: "/")));
  
  //getUserData().then((cadet) => print(cadet.id), onError: (obj, stack) => print("error"));

  runApp(FNApp(store: store));
}

class FNApp extends StatelessWidget {
  final Store<GlobalState> store;

  const FNApp({super.key, required this.store});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (!APIData.authenticated) {
      String s = html.window.location.toString();
      if (s.contains("code=")) {
        html.window.history.pushState(null, 'FalconNet', '');
        String token = s.split("code=").last;
        login(token);
        store.dispatch(FetchProfileInfoAction());
      } else {
        html.window.open('http://localhost:8000/', "_self");
      }
    }

    //Surrounds the app with a store provider so all child widgets can access global state
    return StoreProvider(
      store: store,
      child: StoreConnector<GlobalState, ViewModel<bool>>(
        converter: (store) => ViewModel(store: store, content: store.state.settings.darkTheme),
        builder: (context, model) => MaterialApp.router(
          theme: model.content ? darkTheme : lightTheme,
          routerConfig: fnRouter,
        ),
      )
    );
  }
}