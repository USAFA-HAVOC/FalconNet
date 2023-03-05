import 'dart:io';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:falcon_net/Model/Database/Forms.dart';
import 'package:falcon_net/Model/Database/PassHistoryModel.dart';
import 'package:falcon_net/Model/Database/RoleRequest.dart';
import 'package:falcon_net/Model/Database/UnitData.dart';
import 'package:falcon_net/Model/Database/User.dart';
import 'package:falcon_net/Model/Database/UserGrades.dart';
import 'package:falcon_net/Model/Database/UserSummaryList.dart';
import 'package:falcon_net/Model/Serializers.dart';
import 'package:built_collection/built_collection.dart';

import '../Database/CadetLeave.dart';
import '../Database/CadetPass.dart';
import '../Database/DIRequest.dart';
import '../Database/GradeSubmission.dart';
import '../Database/SquadronAssignRequest.dart';
import '../Database/Unit.dart';
import '../Database/UnitAssignRequest.dart';
import '../Database/UnitDataRequest.dart';
import '../Database/UnitList.dart';
import '../Database/WingData.dart';

final options = BaseOptions(
  baseUrl: 'https://api.ethanchapman.dev/',
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

Dio dio = Dio(options);

class Endpoint<Req, Res> {
  String path;
  bool protected;
  bool get;

  Endpoint(this.path, {this.protected = false, this.get = false});

  Future<Res> call(Req request, {String? token}) async {
    dynamic data;

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
  static Endpoint<void, User> profileGet = Endpoint("/profile/info", get: true);
  static Endpoint<User, bool> profileEdit = Endpoint("/profile/edit");
  static Endpoint<CadetLeave, CadetLeave> leaveCreate = Endpoint("/leave/create");
  static Endpoint<CadetLeave, bool> leaveUpdate = Endpoint("/leave/create");
  static Endpoint<void, bool> leaveClear = Endpoint("/leave/clear");
  static Endpoint<CadetPass, CadetPass> passCreate = Endpoint("/passes/create");
  static Endpoint<void, bool> passClose = Endpoint("/passes/close");
  static Endpoint<CadetPass, bool> passUpdate = Endpoint("/passes/update");
  static Endpoint<void, PassHistoryModel> passHistory = Endpoint("/passes/history");
  static Endpoint<void, bool> selfSign = Endpoint("/accountability/self-sign");
  static Endpoint<DIRequest, bool> sdoSign = Endpoint("/accountability/sdo-sign");
  static Endpoint<void, WingData> cwoc = Endpoint("/pages/cwoc", get: true);
  static Endpoint<void, UnitData> sdo = Endpoint("/pages/sdo", get: true);
  static Endpoint<UnitDataRequest, UnitData> unitData = Endpoint("/pages/sdo", get: true);
  static Endpoint<void, UserGrades> grades = Endpoint("/grades/info", get: true);
  static Endpoint<GradeSubmission, bool> gradesSet = Endpoint("/grades/set");
  static Endpoint<void, BuiltList<FormOne>> formsGet = Endpoint("/forms/info", get: true);
  static Endpoint<RoleRequest, bool> rolesSet = Endpoint("/roles/set");
  static Endpoint<SquadronAssignRequest, bool> squadAssign = Endpoint("squadron/assign");
  static Endpoint<UnitAssignRequest, bool> unitAssign = Endpoint("unit/assign");
  static Endpoint<void, UserSummaryList> assignmentGet = Endpoint("unit/assignment-get");
  static Endpoint<void, UnitList> unitsGet = Endpoint("unit/list");
  static Endpoint<Unit, Unit> unitCreate = Endpoint("unit/create");
  static Endpoint<Unit, bool> unitEdit = Endpoint("unit/modify");
  static Endpoint<Unit, bool> unitDelete = Endpoint("unit/delete");
}

class APIData {
  static bool authenticated = false;
  static User? userData;
}

Future<void> login(String token) async {
  dio.options.headers = {"Authorization": "Bearer $token"};
  APIData.authenticated = true;
}
