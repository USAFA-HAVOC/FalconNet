import 'dart:async';

import 'package:aad_oauth/model/config.dart';
import 'package:async_redux/async_redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:falcon_net/Model/Database/CadetAccountability.dart';
import 'package:falcon_net/Model/Database/CadetPassAllocation.dart';
import 'package:falcon_net/Model/Database/User.dart';
import 'package:falcon_net/Model/Database/UserNotification.dart';
import 'package:falcon_net/Model/Database/UserPersonalInfo.dart';
import 'package:falcon_net/Model/Store/Actions/GlobalAction.dart';
import 'package:falcon_net/Model/Store/Actions/SettingsAction.dart';
import 'package:falcon_net/Model/Store/AppStatus.dart';
import 'package:falcon_net/Model/Store/Endpoints.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Services/AuthService.dart';
import 'package:falcon_net/Services/SchedulingService.dart';
import 'package:falcon_net/Theme/Dark/DarkTheme.dart';
import 'package:falcon_net/Theme/Light/LightTheme.dart';
import 'package:falcon_net/Theme/Random/RandomTheme.dart';
import 'package:falcon_net/Utility/FNConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Model/Database/Roles.dart';
import 'Model/Database/UserSettings.dart';
import 'Router/FNRouter.dart';
import 'Structure/Components/ViewModel.dart';
import 'Services/NotificationService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize a default store
  //Replace the default global state with an api call
  final store = Store<GlobalState>(
      initialState: GlobalState((b1) => b1
        ..status = AppStatus.loading
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
            ..individual_pass_status = true
            ..effective_pass_status = true
            ..class_year_idx = 3
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
          ..pushNotifications = true).toBuilder()
      )
  );

  final Config authConfig = Config(
    tenant: tenant,
    clientId: clientId,
    scope: "$clientId/FalconNet offline_access",
    // redirectUri is Optional as a default is calculated based on app type/web location
    redirectUri: "$apiLocation/mobile_redirect",
    navigatorKey: navigatorKey,
    webUseRedirect: true, // default is false - on web only, forces a redirect flow instead of popup auth
    //Optional parameter: Centered CircularProgressIndicator while rendering web page in WebView
    loader: const Center(child: CircularProgressIndicator()),
  );

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //Must be called first
  await NotificationService().init();
  AuthService().init(authConfig, null);
  SchedulingService().init();
  await store.dispatch(SettingsAction.retrieve());
  var account = (await SharedPreferences.getInstance()).getBool("account") ?? false;

  FlutterNativeSplash.remove();

  runApp(
    FNApp(
      store: store,
      account: account
    )
  );
}

class RouterComponents {
  final String theme;
  final bool party;
  final bool loaded;

  const RouterComponents({required this.theme, required this.party, required this.loaded});
}

class FNApp extends StatefulWidget {
  final Store<GlobalState> store;
  final bool account;

  const FNApp({super.key, required this.store, required this.account});

  @override
  State<StatefulWidget> createState() => FNAppState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class FNAppState extends State<FNApp> {
  late GoRouter router;
  late GoRouter ppRouter;

  @override
  void initState() {
    Timer.periodic(const Duration(minutes: 5), (timer) {
      widget.store.dispatch(GlobalAction.initialize());
    });

    attemptGetWebToken();
    if (APIData.authenticated) {
      router = fnRouter(navigatorKey, SignState.signed, false);
      ppRouter = fnRouter(navigatorKey, SignState.signed, true);
    }
    else {
      router = fnRouter(navigatorKey, widget.account ? SignState.account : SignState.none, false);
      ppRouter = fnRouter(navigatorKey, widget.account ? SignState.account : SignState.none, true);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.account) {
      attemptLogin().then((_) {
        widget.store.dispatch(GlobalAction.initialize());
      });
    }

    //Surrounds the app with a store provider so all child widgets can access global state
    return StoreProvider(
      store: widget.store,
      child: StoreConnector<GlobalState, ViewModel<RouterComponents>>(
        converter: (store) => ViewModel(
          store: store,
          content: RouterComponents(
            theme: store.state.settings.theme,
            party: store.state.user.roles.any((r) => r.role == Roles.permanent_party.name),
            loaded: store.state.status == AppStatus.nominal
          )
        ),
        builder: (context, model) {
          if (!model.content.party || !model.content.loaded) {
            return MaterialApp.router(
                theme: model.content.theme == "light" ? lightTheme : randomTheme,
                darkTheme: darkTheme,
                themeMode: model.content.theme == "dark" ? ThemeMode.dark : ThemeMode.light,
                routerConfig: router
            );
          }
          return MaterialApp.router(
              theme: model.content.theme == "light" ? lightTheme : randomTheme,
              darkTheme: darkTheme,
              themeMode: model.content.theme == "dark" ? ThemeMode.dark : ThemeMode.light,
              routerConfig: ppRouter
          );
        }
      ),
    );
  }
}