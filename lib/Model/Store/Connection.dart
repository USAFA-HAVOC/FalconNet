import 'package:dio/dio.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';

var connection = Dio(
  BaseOptions(
    baseUrl: "http://0.0.0.0:8000/",
    connectTimeout: 5000,
    receiveTimeout: 3000,
  )
);
