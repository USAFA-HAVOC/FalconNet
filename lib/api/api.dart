import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:falconnet/api/models.dart';

var options = BaseOptions(
  baseUrl: 'http://localhost:8000/',
  connectTimeout: 5000,
  receiveTimeout: 3000,
);
Dio dio = Dio(options);

class Endpoint<Req, Res> {
  String path;
  bool protected;
  bool get;

  Endpoint(this.path, {this.protected = false, this.get = false});

  Future<Res> hit(Req request) async {
    var data;

    if (request is String || request is FormData || request is Map || request == null) {
      data = request;
    } else {
      try {
        data = serializers.serialize(request);
      } on StateError {
        data = request;
      }
    }

    Response res;

    if (get) {
      res = await dio.get(path, queryParameters: data);
    } else {
      res = await dio.post(path, data: data);
    }

    return serializers.deserialize(res.data, specifiedType: FullType(Res)) as Res;
  }
}

class Endpoints {
  static Endpoint<FormData, LoginResponse> token = Endpoint("/auth/token");
  static Endpoint<void, Cadet> profile = Endpoint("/pages/profile", get: true);
  static Endpoint<void, CWOCViewData> cwoc = Endpoint("/pages/cwoc", get: true);
}

Future<Cadet> login(String username) async {
  LoginResponse r = await Endpoints.token.hit(FormData.fromMap({'username': username, 'password': 'password'}));
  dio.options.headers = {"Authorization": "Bearer ${r.access_token}"};
  return await Endpoints.profile.hit(null);
}