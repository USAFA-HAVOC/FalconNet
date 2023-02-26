import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/helper/mobile_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:aad_oauth/model/failure.dart';
import 'package:aad_oauth/model/token.dart';
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
import 'package:falcon_net/Utility/CustomOAuth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


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

final navigatorKey = GlobalKey<NavigatorState>();

class FNAppState extends State<FNApp> {
  late bool signed;

  @override
  void initState() {
    /// todo: session management
    signed = false;
    super.initState();
  }

  void webLogin() {
    if (!APIData.authenticated) {
      String s = html.window.location.toString();
      if (s.contains("code=")) {
        html.window.history.pushState(null, 'FalconNet', '');
        String token = s.split("code=").last;
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

  void appLogin() async {
    const String APP_CLIENT_ID = '198ea96e-078e-4bdc-9b90-0dea3a9ea43b';
    const String TENANT_ID = '7ab80a06-f029-45c0-84d1-7dad19ce3c61';

    final Config config = Config(
      tenant: TENANT_ID,
      clientId: APP_CLIENT_ID,
      scope: "$APP_CLIENT_ID/FalconNet",
      // redirectUri is Optional as a default is calculated based on app type/web location
      redirectUri: "https://api.ethanchapman.dev",
      navigatorKey: navigatorKey,
      webUseRedirect: true, // default is false - on web only, forces a redirect flow instead of popup auth
      //Optional parameter: Centered CircularProgressIndicator while rendering web page in WebView
      loader: const Center(child: CircularProgressIndicator()),
    );

    final CustomOAuth oauth = CustomOAuth(config);

    var res = await oauth.login();
    
    Token? t = res.fold((l) => null, (r) => r);

    login(t!.accessToken!);

    widget.store.dispatch(GlobalAction.initialize());

    setState(() {
      signed = true;
    });
  }

  Widget build(BuildContext context) {
    if (!signed) {
      if (kIsWeb) {
        webLogin();
      }
      else {
        appLogin();
      }
    }

    //Surrounds the app with a store provider so all child widgets can access global state
    return StoreProvider(
      store: widget.store,
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

class LoginView extends StatefulWidget {
  final void Function(String) onLogin;
  final void Function()? onCancel;

  const LoginView({super.key, required this.onLogin, this.onCancel});

  @override
  State<LoginView> createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  final GlobalKey webKey = GlobalKey();
  InAppWebViewController? webController;

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      key: webKey,
      initialUrlRequest: URLRequest(url: Uri.parse("https://api.ethanchapman.dev/")),
      onWebViewCreated: (controller) {
        webController = controller;
        print("created webview");
      },
    );
  }
}