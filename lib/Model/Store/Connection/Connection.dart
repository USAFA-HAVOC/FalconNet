import 'dart:io';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:falcon_net/Model/Database/User.dart';
import 'package:falcon_net/Model/Serializers.dart';
import 'package:shared_preferences/shared_preferences.dart';

final options = BaseOptions(
  baseUrl: 'http://localhost:8000/',
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
  static Endpoint<void, User> profile = Endpoint("/profile/info", get: true);
  static Endpoint<User, bool> profileEdit = Endpoint("/profile/edit");
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
