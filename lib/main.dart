import 'dart:async';

import 'package:aad_oauth/model/config.dart';
import 'package:async_redux/async_redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:falcon_net/Model/Database/User.dart';
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
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Model/Database/Role.dart';
import 'Model/Database/UserSettings.dart';
import 'Router/FNRouter.dart';
import 'Structure/Components/ViewModel.dart';
import 'Services/NotificationService.dart';
import 'firebase_options.dart';

//Ethan is dumb
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase app
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Enable Firebase Crashlytics (only on mobile)
  if (!kIsWeb) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  //Initialize a default store
  //Replace the default global state with an api call
  final store = Store<GlobalState>(
      initialState: GlobalState((b1) => b1
        ..status = AppStatus.loading
        ..user = User((b2) => b2
          ..id = ""
          ..ms_oid = ""
          ..roles = ListBuilder()
          ..personal_info = UserPersonalInfo((b3) => b3
            ..full_name = ""
            ..email = ""
            ..phone_number = ""
            ..room_number = "").toBuilder()).toBuilder()
        ..settings = UserSettings((b2) => b2
          ..theme = "light"
          ..taskPush = false
          ..diPush = false
          ..passPush = false
          ..pushNotifications = false).toBuilder()));

  final Config authConfig = Config(
    tenant: tenant,
    clientId: clientId,
    scope: "$clientId/FalconNet offline_access",
    // redirectUri is Optional as a default is calculated based on app type/web location
    redirectUri: "${APIData().apiLocation}/mobile_redirect",
    navigatorKey: navigatorKey,
    webUseRedirect:
        true, // default is false - on web only, forces a redirect flow instead of popup auth
    //Optional parameter: Centered CircularProgressIndicator while rendering web page in WebView
    loader: const Center(child: CircularProgressIndicator()),
  );

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //Must be called first and in this order
  await APIData().init();
  await NotificationService().init();
  AuthService().init(authConfig, null);
  SchedulingService().init();
  await store.dispatch(SettingsAction.retrieve());
  var prefs = (await SharedPreferences.getInstance());
  var account = prefs.getBool("account") ?? false;

  FlutterNativeSplash.remove();

  runApp(FNApp(store: store, account: account));
}

class RouterComponents {
  final String theme;
  final bool party;
  final bool loaded;

  const RouterComponents(
      {required this.theme, required this.party, required this.loaded});
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
    Timer.periodic(const Duration(minutes: 1), (timer) {
      if (APIData().authenticated) {
        widget.store.dispatch(GlobalAction.initialize());
      }
    });

    attemptGetWebToken();
    if (APIData().authenticated) {
      router = fnRouter(navigatorKey, SignState.signed, false);
      ppRouter = fnRouter(navigatorKey, SignState.signed, true);
    } else {
      router = fnRouter(navigatorKey,
          widget.account ? SignState.account : SignState.none, false);
      ppRouter = fnRouter(navigatorKey,
          widget.account ? SignState.account : SignState.none, true);
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
                party: store.state.user.roles
                    .any((r) => r.name == Roles.permanent_party.name),
                loaded: store.state.status == AppStatus.nominal)),
        builder: (context, model) {
          return MaterialApp.router(
              theme: model.content.theme == "light" ? lightTheme : randomTheme,
              darkTheme: darkTheme,
              themeMode: model.content.theme == "dark" ? ThemeMode.dark : ThemeMode.light,
              routerConfig: (!model.content.party || !model.content.loaded) ? router : ppRouter,
              debugShowCheckedModeBanner: false,
          );
        }
      ),
    );
  }
}
