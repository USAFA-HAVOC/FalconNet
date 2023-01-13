import 'dart:io';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Models.dart';

final options = BaseOptions(
  baseUrl: 'http://0.0.0.0:8000/',
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

    try {
      if (get) {
        res = await dio.get(path, queryParameters: data);
      } else {
        res = await dio.post(path, data: data, options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json"
        }));
      }
    } on DioError {
      await login(APIData.email);
      if (get) {
        res = await dio.get(path, queryParameters: data);
      } else {
        res = await dio.post(path, data: data);
      }
    }


    return serializers.deserialize(res.data, specifiedType: FullType(Res)) as Res;
  }
}

class Endpoints {
  static Endpoint<FormData, LoginResponse> token = Endpoint("/auth/token");
  static Endpoint<void, Cadet> profile = Endpoint("/profile/info", get: true);
  static Endpoint<void, CWOCViewData> cwoc = Endpoint("/pages/cwoc", get: true);
  static Endpoint<DIRequest, bool> signDI = Endpoint("/accountability/sign");
}

class APIData {
  static bool authenticated = false;
  static Cadet? user_data;
  static String email = "c23christopher.vonhaasl@afacademy.af.edu";
// static String email = "C26Ethan.Chapman@afacademy.af.edu";
}

Cadet defaultCadet = Cadet((b) => b
  ..id = ""
  ..personal_info = CadetPersonalInfo((b2) => b2
    ..email = ""
    ..full_name = ""
    ..phone_number = ""
    ..room_number = ""
    ..squadron = 0
    ..group = 0
    ..unit = ""
  ).toBuilder()
  ..pass_allocation = C4CPassAllocation((b2) => b2
    ..weekend_overnight_passes = 0
    ..weekday_overnight_passes = 0
    ..weekday_day_passes = 0
  ).toBuilder()
  ..di_time = DateTime.now()
  ..last_login = DateTime.now()
  ..individual_pass_status = "OPEN"
);

Future<void> login(String username) async {
  if (APIData.authenticated) return;
  LoginResponse r = await Endpoints.token.hit(FormData.fromMap({'username': username, 'password': 'password'}));
  dio.options.headers = {"Authorization": "Bearer ${r.access_token}"};
  APIData.authenticated = true;
}

Future<Cadet> getUserData() async {
  APIData.user_data ??= await Endpoints.profile.hit(null);
  return APIData.user_data!;
}

Future<bool> sign() async {
  if (APIData.user_data == null) {
    await login(APIData.email);
    if (APIData.user_data == null) {
      return false;
    }
  }

  return Endpoints.signDI.hit(DIRequest((builder) => builder.cadet_id = APIData.user_data!.id));
}