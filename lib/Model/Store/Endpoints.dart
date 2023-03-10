import 'dart:io';

import 'package:aad_oauth/model/config.dart';
import 'package:aad_oauth/model/token.dart';
import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:falcon_net/Model/Database/FormSummary.dart';
import 'package:falcon_net/Model/Database/PassHistoryModel.dart';
import 'package:falcon_net/Model/Database/RoleRequest.dart';
import 'package:falcon_net/Model/Database/UnitData.dart';
import 'package:falcon_net/Model/Database/User.dart';
import 'package:falcon_net/Model/Database/UserGrades.dart';
import 'package:falcon_net/Model/Database/UserSummaryList.dart';
import 'package:falcon_net/Model/Serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:falcon_net/Utility/FNOAuth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:universal_html/html.dart" as html;

import '../../main.dart';
import '../Database/CadetLeave.dart';
import '../Database/CadetPass.dart';
import '../Database/DIRequest.dart';
import '../Database/GradeSubmission.dart';
import '../Database/SquadronAssignRequest.dart';
import '../Database/Unit.dart';
import '../Database/UnitAssignRequest.dart';
import '../Database/UnitDataRequest.dart';
import '../Database/UnitList.dart';
import '../Database/UserList.dart';
import '../Database/WingData.dart';
import 'DemoData.dart';

final options = BaseOptions(
  baseUrl: 'https://api.ethanchapman.dev/',
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

Dio dio = Dio(options);

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

Future<void> authLogin() async {
  var res = await oauth.login();
  Token? t = res.fold((l) => null, (r) => r);
  login(t!.accessToken!);
}

final FNOAuth oauth = FNOAuth(config, null);

class Endpoint<Req, Res> {
  String path;
  bool protected;
  bool get;

  Endpoint(this.path, {this.protected = false, this.get = false});

  Future<Res> call(Req request, {String? token}) async {

    if (APIData.demo) {
      return demoEndpoints[path]!(request) as Res;
    }

    dynamic data;

    await authLogin();

    if (request is String || request is FormData || request is Map || request == null) {
      data = request;
    } else {
      try {
        data = serializers.serialize(request, specifiedType: FullType(Req));
      } on StateError {
        data = request;
      }
    }

    Response res;

    if (get) {
      res = await dio.get(path, queryParameters: data);
    } else {
      res = await dio.post(path, data: data, options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json"
      }));
    }

    return serializers.deserialize(res.data, specifiedType: FullType(Res)) as Res;
  }
}

class Endpoints {
  static Endpoint<void, User> getProfile = Endpoint("/profile/info", get: true);
  static Endpoint<User, bool> editProfile = Endpoint("/profile/edit");
  static Endpoint<CadetLeave, CadetLeave> createLeave = Endpoint("/leave/create");
  static Endpoint<CadetLeave, bool> updateLeave = Endpoint("/leave/create");
  static Endpoint<void, bool> clearLeave = Endpoint("/leave/clear");
  static Endpoint<CadetPass, CadetPass> createPass = Endpoint("/passes/create");
  static Endpoint<void, bool> closePass = Endpoint("/passes/close");
  static Endpoint<CadetPass, bool> updatePass = Endpoint("/passes/update");
  static Endpoint<void, PassHistoryModel> getPassHistory = Endpoint("/passes/history");
  static Endpoint<void, bool> signSelf = Endpoint("/accountability/self-sign");
  static Endpoint<DIRequest, bool> signOther = Endpoint("/accountability/sdo-sign");
  static Endpoint<void, WingData> getWing = Endpoint("/pages/cwoc", get: true);
  static Endpoint<void, UnitData> getOwnUnit = Endpoint("/pages/sdo", get: true);
  static Endpoint<UnitDataRequest, UnitData> getUnit = Endpoint("/pages/sdo", get: true);
  static Endpoint<void, UserGrades> getGrades = Endpoint("/grades/info", get: true);
  static Endpoint<GradeSubmission, bool> setGrades = Endpoint("/grades/set");
  static Endpoint<void, BuiltList<FormSummary>> getForms = Endpoint("/forms/info", get: true);
  static Endpoint<RoleRequest, bool> setRoles = Endpoint("/roles/set");
  static Endpoint<SquadronAssignRequest, bool> assignSquad = Endpoint("squadron/assign");
  static Endpoint<UnitAssignRequest, bool> assignUnit = Endpoint("unit/assign");
  static Endpoint<void, UserSummaryList> getUserSummaries = Endpoint("unit/assignment-get");
  static Endpoint<void, UserList> getUsers = Endpoint("users/get", get: true);
  static Endpoint<void, UnitList> listUnits = Endpoint("unit/list");
  static Endpoint<Unit, Unit> createUnit = Endpoint("unit/create");
  static Endpoint<Unit, bool> editUnit = Endpoint("unit/modify");
  static Endpoint<Unit, bool> deleteUnit = Endpoint("unit/delete");
}

class APIData {
  static bool authenticated = false;
  static bool demo = false;
  static User? userData;
}

Future<void> login(String token) async {
  dio.options.headers = {"Authorization": "Bearer $token"};
  APIData.authenticated = true;
  await (await SharedPreferences.getInstance()).setBool("account", true);
}

void demo() {
  APIData.demo = true;
}

Future<void> attemptLogin() async {
  String? authToken;
  if (kIsWeb) {
    Uri s = Uri.parse(html.window.location.toString());
    if (s.queryParameters.containsKey("code")) {
      html.window.history.pushState(null, 'FalconNet', '');
      authToken = s.queryParameters["code"];
    }
  }
  await authLogin();
  oauth.setCode(authToken);
}
