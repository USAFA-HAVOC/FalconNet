import 'dart:async';

import 'package:aad_oauth/model/config.dart';
import 'package:aad_oauth/model/token.dart';
import 'package:async_redux/async_redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:falcon_net/Model/Database/CadetAccountability.dart';
import 'package:falcon_net/Model/Database/CadetPassAllocation.dart';
import 'package:falcon_net/Model/Database/User.dart';
import 'package:falcon_net/Model/Database/UserNotification.dart';
import 'package:falcon_net/Model/Database/UserPersonalInfo.dart';
import 'package:falcon_net/Model/Store/Actions/GlobalAction.dart';
import 'package:falcon_net/Model/Store/Actions/InfoAction.dart';
import 'package:falcon_net/Model/Store/Endpoints.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';
import 'package:falcon_net/Theme/Dark/DarkTheme.dart';
import 'package:falcon_net/Theme/Light/LightTheme.dart';
import 'package:falcon_net/Theme/Random/RandomTheme.dart';
import 'package:falcon_net/Utility/FNOAuth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import 'Model/Database/UserSettings.dart';
import 'Router/FNRouter.dart';
import 'Structure/Components/ViewModel.dart';
import "package:universal_html/html.dart" as html;

void main() {
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
                  ..di_signed_name = ""
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

  runApp(FNApp(store: store));
}

class FNApp extends StatefulWidget {
  final Store<GlobalState> store;

  const FNApp({super.key, required this.store});

  @override
  State<StatefulWidget> createState() => FNAppState();
}

class FNAppState extends State<FNApp> {
  late bool signed;
  final navigatorKey = GlobalKey<NavigatorState>();
  late GoRouter router= fnRouter(navigatorKey);

  @override
  void initState() {
    /// todo: session management
    signed = false;
    Timer.periodic(const Duration(seconds: 10), (timer) {
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
      }
      else {
        html.window.open('https://api.ethanchapman.dev/', "_self");
      }
    }
  }

  void appLogin(String? auth_token) async {
    const String clientId = '198ea96e-078e-4bdc-9b90-0dea3a9ea43b';
    const String tenant = '7ab80a06-f029-45c0-84d1-7dad19ce3c61';

    final Config config = Config(
      tenant: tenant,
      clientId: clientId,
      scope: "$clientId/FalconNet offline_access",
      // redirectUri is Optional as a default is calculated based on app type/web location
      redirectUri: "https://api.ethanchapman.dev",
      navigatorKey: navigatorKey,
      webUseRedirect: true, // default is false - on web only, forces a redirect flow instead of popup auth
      //Optional parameter: Centered CircularProgressIndicator while rendering web page in WebView
      loader: const Center(child: CircularProgressIndicator()),
    );


    final FNOAuth oauth = FNOAuth(config, auth_token);

    var res = await oauth.login();
    
    Token? t = res.fold((l) => null, (r) => r);

    login(t!.accessToken!);

    widget.store.dispatch(GlobalAction.initialize());

    setState(() {
      signed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    String? auth_token;

    if (!signed) {

      if (kIsWeb) {
        Uri s = Uri.parse(html.window.location.toString());
        print(s.queryParameters);
        if (s.queryParameters.containsKey("code")) {
          html.window.history.pushState(null, 'FalconNet', '');
          auth_token = s.queryParameters["code"];
        }
      }

      print(auth_token);
      appLogin(auth_token);
    }

    //Surrounds the app with a store provider so all child widgets can access global state
    return StoreProvider(
      store: widget.store,
      child: StoreConnector<GlobalState, ViewModel<String>>(
        converter: (store) => ViewModel(store: store, content: store.state.settings.theme),
        builder: (context, model) => MaterialApp.router(
          theme: model.content == "light" ? lightTheme : (model.content == "dark" ? darkTheme : randomTheme),
          routerConfig: router,
        ),
      ),
    );
  }
}