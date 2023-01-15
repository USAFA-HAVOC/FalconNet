import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Data/FormOne.dart';
import 'package:falcon_net/Model/Data/UserGrades.dart';
import 'package:falcon_net/Model/Store/Actions/SettingsAction.dart';
import 'package:flutter/material.dart';

import 'Model/Data/Cadet.dart';
import 'Model/Data/PassAllocation.dart';
import 'Model/Data/Role.dart';
import 'Model/Data/UserSettings.dart';
import 'Model/Store/Actions/NotificationAction.dart';
import 'Router/FNRouter.dart';
import 'Structure/Components/ViewModel.dart';
import 'Theme/Dark/DarkTheme.dart';
import 'Theme/Light/LightTheme.dart';
import 'Model/Data/Pass.dart';
import 'Model/Store/GlobalState.dart';
import 'Model/Data/UserNotification.dart';

void main() {

  //Initialize a default store
  //Replace the default global state with an api call
  final store = Store<GlobalState>(
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
          settings: UserSettings(),
          grades: UserGrades(
            amiScores: [
              Grade(
                  score: 97,
                  description: "Disgusting",
              ),
              Grade(
                score: 94,
              ),
              Grade(
                score: 93,
                description: "Homemade yogurt",
              ),
            ],
            samiScores: [
              Grade(
                  score: 98,
                  description: "dust",
              )
            ],
          ),
          allocation: PassAllocation(weekdayDay: 5, weekdayOvernight: 1, weekendOvernight: 1),
          forms: [
            FormOne(title: "Test", description: "READ CSND", signed: false),
            FormOne(title: "Test Two", description: "bruh", signed: false),
          ],
          roles: [Role.jdo, Role.signable, Role.cwoc, Role.signable, Role.sdo],
      )
  );

  store.dispatch(SettingsAction.retrieve());
  store.dispatch(NotificationAction.retrieve());
  store.dispatch(NotificationAction.add(UserNotification(message: "You logged in", destination: "/")));

  //getUserData().then((cadet) => print(cadet.id), onError: (obj, stack) => print("error"));

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

        //Navigates to child pages based on path
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