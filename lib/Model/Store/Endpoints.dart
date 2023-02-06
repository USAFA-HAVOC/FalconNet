import 'dart:io';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:falcon_net/Model/Database/CWOCViewData.dart';
import 'package:falcon_net/Model/Database/Forms.dart';
import 'package:falcon_net/Model/Database/User.dart';
import 'package:falcon_net/Model/Database/UserGrades.dart';
import 'package:falcon_net/Model/Serializers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:built_collection/built_collection.dart';

import '../Database/CadetLeave.dart';
import '../Database/CadetPass.dart';
import '../Database/DIRequest.dart';

final options = BaseOptions(
  baseUrl: 'https://api.ethanchapman.dev/',
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

final Future<SharedPreferences> preferences = SharedPreferences.getInstance();

Dio dio = Dio(options);

class Endpoint<Req, Res> {
  String path;
  bool protected;
  bool get;

  Endpoint(this.path, {this.protected = false, this.get = false});

  Future<Res> hit(Req request, {String? token}) async {
    var data;

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
  static Endpoint<CadetLeave, bool> leaveSet = Endpoint("/leave/create");
  static Endpoint<void, bool> leaveClear = Endpoint("/leave/clear");
  static Endpoint<void, CadetLeave> leaveGet = Endpoint("/leave/info", get: true);
  static Endpoint<CadetPass, bool> passSet = Endpoint("/passes/create");
  static Endpoint<void, bool> passClose = Endpoint("/passes/close");
  static Endpoint<void, CadetPass> passGet = Endpoint("/passes/info", get: true);
  static Endpoint<void, BuiltList<CadetPass>> passHistory = Endpoint("/passes/history", get: true);
  static Endpoint<void, bool> selfSign = Endpoint("/accountability/self-sign");
  static Endpoint<DIRequest, bool> sdoSign = Endpoint("/accountability/sdo-sign");
  static Endpoint<void, CWOCViewData> cwocUnit = Endpoint("/pages/cwoc", get: true);
  static Endpoint<void, UserGrades> grades = Endpoint("/grades/info", get: true);
  static Endpoint<void, BuiltList<FormOne>> formsGet = Endpoint("/forms/info", get: true);
}

class APIData {
  static bool authenticated = false;
  static User? userData;
}

// User defaultCadet = User((b) => b
//   ..id = ""
//   ..personal_info = CadetPersonalInfo((b2) => b2
//     ..email = ""
//     ..full_name = ""
//     ..phone_number = ""
//     ..room_number = ""
//     ..squadron = 0
//     ..group = "CG00"
//     ..unit = ""
//   ).toBuilder()
//   ..pass_allocation = C4CPassAllocation((b2) => b2
//     ..weekend_overnight_passes = 0
//     ..weekday_overnight_passes = 0
//     ..weekday_day_passes = 0
//   ).toBuilder()
//   ..di_time = DateTime.now().toUtc()
//   ..last_login = DateTime.now().toUtc()
//   ..individual_pass_status = "OPEN"
// );

Future<void> login(String token) async {
  dio.options.headers = {"Authorization": "Bearer $token"};
  APIData.authenticated = true;
}
