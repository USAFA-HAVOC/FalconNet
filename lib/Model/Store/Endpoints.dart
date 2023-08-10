import 'dart:io';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:falcon_net/Model/Database/AccountabilityEvent.dart';
import 'package:falcon_net/Model/Database/InitialData.dart';
import 'package:falcon_net/Model/Database/PassHistoryModel.dart';
import 'package:falcon_net/Model/Database/PassStatusRequest.dart';
import 'package:falcon_net/Model/Database/RoleRequest.dart';
import 'package:falcon_net/Model/Database/SignRequest.dart';
import 'package:falcon_net/Model/Database/StringRequest.dart';
import 'package:falcon_net/Model/Database/UnitData.dart';
import 'package:falcon_net/Model/Database/User.dart';
import 'package:falcon_net/Model/Database/UserGrades.dart';
import 'package:falcon_net/Model/Database/UserSummaryList.dart';
import 'package:falcon_net/Model/Serializers.dart';
import 'package:falcon_net/Services/AuthService.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:universal_html/html.dart" as html;

import '../Database/CadetLeave.dart';
import '../Database/CadetPass.dart';
import '../Database/GradeSubmission.dart';
import '../Database/IndividualStatusRequest.dart';
import '../Database/SquadronAssignRequest.dart';
import '../Database/Unit.dart';
import '../Database/UnitAssignRequest.dart';
import '../Database/UnitGrades.dart';
import '../Database/UnitList.dart';
import '../Database/UserList.dart';
import '../Database/WingData.dart';
import 'DemoData.dart';

class APIData {
  bool authenticated = false;
  bool demo = false;
  bool devServer = false;
  User? userData;

  static const _devApiLocation = "https://api.ethanchapman.dev";
  static const _prodApiLocation = "https://api.ethanchapman.dev";

  String get apiLocation => devServer ? _devApiLocation : _prodApiLocation;

  static const String _tenantID = "7ab80a06-f029-45c0-84d1-7dad19ce3c61";
  static const String _clientID = "198ea96e-078e-4bdc-9b90-0dea3a9ea43b";
  String get authURL => "https://login.microsoftonline.com/$_tenantID/oauth2/v2.0/authorize"
      "?client_id=$_clientID"
      "&scope=$_clientID/FalconNet offline_access"
      "&response_type=code"
      "&redirect_uri=$apiLocation/web_login";


  static final APIData _instance = APIData._internal();

  APIData._internal();

  factory APIData() => _instance;

  Future<void> init() async {
    var preferences = await SharedPreferences.getInstance();
    var server = preferences.getBool("dev-server");
    if (server == null) {
      await preferences.setBool("dev-server", false);
    }
    else {
      devServer = server;
    }
  }
}

final options = BaseOptions(
  baseUrl: APIData().apiLocation,
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

Dio dio = Dio(options);

const String clientId = '198ea96e-078e-4bdc-9b90-0dea3a9ea43b';
const String tenant = '7ab80a06-f029-45c0-84d1-7dad19ce3c61';



Future<void> authLogin() async {
  var res = await AuthService().login();
  res.fold((l) {
    if (kDebugMode) {
      print("AUTH FAILURE $l");
    }
  }, (r) {
    login(r.accessToken!);
  });
}

class Endpoint<Req, Res> {
  String path;
  bool protected;
  bool get;

  Endpoint(this.path, {this.protected = false, this.get = false});

  Future<Res> call(Req request, {String? token}) async {

    if (APIData().demo) {
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
  static Endpoint<void, InitialData> initial = Endpoint("/pages/home", get: true);

  static Endpoint<void, User> getProfile = Endpoint("/profile/info", get: true);
  static Endpoint<User, bool> editProfile = Endpoint("/profile/edit");

  static Endpoint<CadetLeave, CadetLeave> createLeave = Endpoint("/leave/create");
  static Endpoint<CadetLeave, bool> updateLeave = Endpoint("/leave/create");
  static Endpoint<void, bool> clearLeave = Endpoint("/leave/clear");

  static Endpoint<CadetPass, CadetPass> createPass = Endpoint("/passes/create");
  static Endpoint<void, bool> closePass = Endpoint("/passes/close");
  static Endpoint<CadetPass, bool> updatePass = Endpoint("/passes/update");

  static Endpoint<void, PassHistoryModel> getPassHistory = Endpoint("/passes/history");
  static Endpoint<void, UserGrades> getGrades = Endpoint("/grades/info", get: true);
  static Endpoint<GradeSubmission, bool> setGrades = Endpoint("/grades/set");
  static Endpoint<StringRequest, UnitGrades> unitGrades = Endpoint("/grades/unit");

  static Endpoint<RoleRequest, bool> setRoles = Endpoint("/roles/set");

  static Endpoint<SquadronAssignRequest, bool> assignSquad = Endpoint("squadron/assign");
  static Endpoint<UnitAssignRequest, bool> assignUnit = Endpoint("/unit/assign");

  static Endpoint<void, UserSummaryList> getUserSummaries = Endpoint("/users/summaries");
  static Endpoint<void, UserList> getUsers = Endpoint("/users/get", get: true);

  static Endpoint<void, UnitList> listUnits = Endpoint("/unit/list");
  static Endpoint<Unit, Unit> createUnit = Endpoint("/unit/create");
  static Endpoint<Unit, Unit> editUnit = Endpoint("/unit/modify");
  static Endpoint<Unit, Unit> deleteUnit = Endpoint("/unit/delete");

  static Endpoint<StringRequest, WingData> getWing = Endpoint("/unit/summaries");
  static Endpoint<void, UnitData> getOwnUnit = Endpoint("/unit/data");
  static Endpoint<StringRequest, UnitData> getUnit = Endpoint("/unit/data");

  static Endpoint<UnitAssignRequest, bool> setUnit = Endpoint("/unit/set-user");

  static Endpoint<PassStatusRequest, bool> setPassStatus = Endpoint("/unit/set-pass-status");
  static Endpoint<IndividualStatusRequest, bool> setIndividualPassStatus = Endpoint("/users/set-pass-status");

  static Endpoint<AccountabilityEvent, AccountabilityEvent> createEvent = Endpoint("/events/create");
  static Endpoint<StringRequest, bool> deleteEvent = Endpoint("/events/delete");
  static Endpoint<SignRequest, bool> signEvent = Endpoint("/events/sign");
  static Endpoint<void, EventList> getEvents = Endpoint("/events/all", get: true);
}

Future<void> login(String token) async {
  dio.options.headers = {"Authorization": "Bearer $token"};
  APIData().authenticated = true;
  await (await SharedPreferences.getInstance()).setBool("account", true);
}

void demo() => APIData().demo = true;

Future<void> attemptGetWebToken() async {
  if (kIsWeb) {
    Uri s = Uri.parse(html.window.location.toString());
    if (s.queryParameters.containsKey("code")) {
      html.window.history.pushState(null, 'FalconNet', '');
      String? authToken = s.queryParameters["code"];
      AuthService().setCode(authToken);
      await authLogin();
    }
  }
}

Future<void> attemptLogin() async {
  String? authToken;
  if (kIsWeb) {
    Uri s = Uri.parse(html.window.location.toString());
    if (s.queryParameters.containsKey("code")) {
      html.window.history.pushState(null, 'FalconNet', '');
      authToken = s.queryParameters["code"];
      AuthService().setCode(authToken);
    }
  }
  await authLogin();
}

Future<void> logout() async {
  await AuthService().logout();
  APIData().authenticated = false;
  var preferences = await SharedPreferences.getInstance();
  preferences.setBool("account", false);
}