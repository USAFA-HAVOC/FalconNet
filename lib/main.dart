import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:falcon_net/Model/Database/CadetAccountability.dart';
import 'package:falcon_net/Model/Database/CadetPassAllocation.dart';
import 'package:falcon_net/Model/Database/User.dart';
import 'package:falcon_net/Model/Database/UserNotification.dart';
import 'package:falcon_net/Model/Database/UserPersonalInfo.dart';
import 'package:falcon_net/Model/Store/Actions/GlobalAction.dart';
import 'package:falcon_net/Model/Store/Actions/InfoAction.dart';
import 'package:falcon_net/Model/Store/Actions/SettingsAction.dart';
import 'package:falcon_net/Model/Store/Endpoints.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';
import 'package:falcon_net/Theme/Dark/DarkTheme.dart';
import 'package:falcon_net/Theme/Light/LightTheme.dart';
import 'package:falcon_net/Theme/Random/RandomTheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';

import 'Model/Database/UserSettings.dart';
import 'Router/FNRouter.dart';
import 'Structure/Components/ViewModel.dart';
import "package:universal_html/html.dart" as html;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
            ..unit = "CS18").toBuilder()
          ..pass_allocation = CadetPassAllocation((b3) => b3
            ..individual_pass_status = "OPEN"
            ..effective_pass_status = "OPEN"
            ..weekday_day_passes = 0
            ..weekday_overnight_passes = 0
            ..weekend_overnight_passes = 0).toBuilder()
          ..accountability = CadetAccountability((b3) => b3
            ..di_last_signed = DateTime.now().toUtc()
            ..di_signed_by = ""
            ..di_signed_name = "").toBuilder()).toBuilder()
        ..notifications = ListBuilder<UserNotification>([])
        ..settings = UserSettings((b2) => b2
          ..theme = "light"
          ..taskPush = true
          ..diPush = true
          ..passPush = true
          ..pushNotifications = true).toBuilder()));

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(
      widgetsBinding: widgetsBinding); // Preserve splash until app is loaded

  await store.dispatch(SettingsAction.retrieve()); // Retrieve settings

  FlutterNativeSplash.remove(); // Remove splash once app is loaded

  runApp(FNApp(store: store));
}

class FNApp extends StatefulWidget {
  final Store<GlobalState> store;

  const FNApp({super.key, required this.store});

  @override
  State<StatefulWidget> createState() => FNAppState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class FNAppState extends State<FNApp> {
  late bool signed;
  late GoRouter router = fnRouter(navigatorKey);

  @override
  void initState() {
    /// todo: session management
    signed = false;
    Timer.periodic(const Duration(minutes: 5), (timer) {
      if (signed) {
        widget.store.dispatch(InfoAction.retrieve());
      }
    });
    super.initState();
  }

  void webLogin() {
    if (!APIData.authenticated) {
      Uri s = Uri.parse(html.window.location.toString());
      if (s.queryParameters.containsKey("code")) {
        html.window.history.pushState(null, 'FalconNet', '');
        String token = s.queryParameters["code"]!;
        login(token);
        widget.store.dispatch(GlobalAction.initialize());
        setState(() {
          signed = true;
        });
      } else {
        html.window.open('https://api.ethanchapman.dev/', "_self");
      }
    }
  }

  void appLogin() async {
    await authLogin();

    widget.store.dispatch(GlobalAction.initialize());

    setState(() {
      signed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    String? authToken;

    if (!signed) {
      if (kIsWeb) {
        Uri s = Uri.parse(html.window.location.toString());
        if (s.queryParameters.containsKey("code")) {
          html.window.history.pushState(null, 'FalconNet', '');
          authToken = s.queryParameters["code"];
        }
      }

      oauth.setCode(authToken);
      appLogin();
    }

    //Surrounds the app with a store provider so all child widgets can access global state
    return StoreProvider(
      store: widget.store,
      child: StoreConnector<GlobalState, ViewModel<String>>(
        converter: (store) =>
            ViewModel(store: store, content: store.state.settings.theme),
        builder: (context, model) => MaterialApp.router(
          theme: model.content == "light" ? lightTheme : randomTheme,
          darkTheme: darkTheme,
          themeMode: model.content == "dark" ? ThemeMode.dark : ThemeMode.light,
          routerConfig: router,
        ),
      ),
    );
  }
}
