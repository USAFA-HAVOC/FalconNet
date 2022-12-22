import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';

import 'Model/Cadet.dart';
import 'Model/UserSettings.dart';
import 'Router/FNRouter.dart';
import 'Theme/FNTheme.dart';
import 'Model/Pass.dart';
import 'Model/GlobalState.dart';
import 'Model/Reducer.dart';
import 'Model/UserNotification.dart';

void main() {
  final store = Store<GlobalState>(
      reducer,
      initialState: GlobalState(
          cadet: Cadet(
            name: "Rylie Anderson",
            phone: "(515) 782-5949",
            room: "6A19",
            squadron: 25
          ),
          history: <Pass>[
            Pass(
              start: DateTime.now(),
              end: null,
              type: "Discretionary",
              description: "Well it looks like I'm going to Denver for the weekend, see ya bitcheees.\nPS. this is a poem I wrote about my relationship with my philosophy teacher:\nRoses are red\nviolets are blue\nkarma's a bitch\nand so are you",
              sca: "123456",
              city: "Da Springs",
              state: "Colorado",
              zip: "50035",
            ),
            Pass(
              start: DateTime.now(),
              end: null,
              type: "Discretionary",
              description: "Weekend",
              sca: null,
              city: "Sponsor's",
              state: "Sponsor's",
              zip: "12345",
            ),
            Pass(
              start: DateTime.now(),
              end: null,
              type: "Discretionary",
              description: "Well it looks like I'm going to Denver for the weekend, see ya bitcheees.\nPS. this is a poem I wrote about my relationship with my philosophy teacher:\nRoses are red\nviolets are blue\nkarma's a bitch\nand so are you",
              sca: "123456",
              city: "Da Springs",
              state: "Colorado",
              zip: "50035",
            ),
            Pass(
              start: DateTime.now(),
              end: null,
              type: "Discretionary",
              description: "Weekend",
              sca: null,
              city: "Sponsor's",
              state: "Sponsor's",
              zip: "12345",
            ),
            Pass(
              start: DateTime.now(),
              end: null,
              type: "Discretionary",
              description: "Well it looks like I'm going to Denver for the weekend, see ya bitcheees.\nPS. this is a poem I wrote about my relationship with my philosophy teacher:\nRoses are red\nviolets are blue\nkarma's a bitch\nand so are you",
              sca: "123456",
              city: "Da Springs",
              state: "Colorado",
              zip: "50035",
            ),
            Pass(
              start: DateTime.now(),
              end: null,
              type: "Discretionary",
              description: "Weekend",
              sca: null,
              city: "Sponsor's",
              state: "Sponsor's",
              zip: "12345",
            ),
          ],
          notifications: <UserNotification>[
            UserNotification(
                message: "Overdue Pass",
                destination: "/"
            ),
            UserNotification(
                message: "Fill in Personal Info",
                destination: "/profile"
            )
          ],
          settings: UserSettings(
            darkTheme: false,
            pushNotifications: false,
            diPush: false,
            passPush: false,
            taskPush: false,
          )
      )
  );
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