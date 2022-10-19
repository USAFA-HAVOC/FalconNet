// ignore_for_file: no_leading_underscores_for_local_identifiers, unnecessary_getters_setters
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/endpoints.dart';
import '../../models/api_error/api_error.dart';
import '../../providers/services_providers.dart';

enum HttpMethod {
  get,
  post,
  patch,
  delete,
  put,
}

extension on HttpMethod {
  String get name {
    switch (this) {
      case HttpMethod.get:
        return 'GET';
      case HttpMethod.post:
        return 'POST';
      case HttpMethod.put:
        return 'PUT';
      case HttpMethod.delete:
        return 'DELETE';
      case HttpMethod.patch:
        return 'PATCH';
    }
  }
}

class DioService {
  DioService(this.ref) {
    _dio = Dio();
    _dio.options.baseUrl = AppEndpoints.movieDbBase;
    _dio.options.sendTimeout = 30000;
    _dio.options.connectTimeout = 30000;
    _dio.options.receiveTimeout = 30000;

    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }

  /// ------------------------
  /// VARIABLES
  /// ------------------------

  final ProviderRef ref;
  late final Dio _dio;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  Dio get dio => _dio;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set dio(Dio value) => _dio = value;

  /// ------------------------
  /// METHODS
  /// ------------------------

  Future<T> request<T>({
    required String url,
    required HttpMethod method,
    required T Function(dynamic data) builder,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? passedData,
    String? token,
    bool jsonHeader = true,
    FormData? formData,
    bool setToken = false,
  }) async {
    try {
      dynamic data;
      if (jsonHeader) {
        data = passedData != null ? jsonEncode(passedData) : null;
      } else {
        data = formData;
      }

      final options = jsonHeader
          ? Options(
              headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                if (token != null) 'Authorization': 'Bearer $token',
              },
              method: method.name,
            )
          : Options(
              headers: {
                'Content-Type': 'multipart/form-data',
                if (token != null) 'Authorization': 'Bearer $token',
              },
              method: method.name,
            );

      final Response response;

      switch (method.name) {
        case 'GET':
          response = await dio.get(
            url,
            options: options,
            queryParameters: parameters,
          );
          break;
        case 'POST':
          response = await dio.post(
            url,
            data: data,
            options: options,
          );
          break;
        case 'PUT':
          response = await dio.put(
            url,
            data: data,
            options: options,
          );
          break;
        case 'DELETE':
          response = await dio.delete(
            url,
            data: data,
            options: options,
          );
          break;
        case 'PATCH':
          response = await dio.patch(
            url,
            data: data,
            options: options,
          );
          break;
        default:
          response = await dio.get(
            url,
            options: options,
          );
          break;
      }

      // Set token as received in header
      if (setToken) {
        final _storageService = ref.read(storageServiceProvider);

        response.headers.forEach((name, values) async {
          if (name == 'Authorization') {
            await _storageService.setValue(
              key: 'token',
              data: values.first,
            );
          }
        });
      }

      return builder(response.data);
    } on DioError catch (e) {
      try {
        final errorData = e.response?.data as Map<String, dynamic>;

        if (e.message.contains('Network is unreachable')) {
          throw ApiError(message: 'No internet connection');
        }

        /// Process status code
        switch (e.response?.statusCode) {
          case 401:
            throw ApiError(message: 'Invalid API Key');
          case 404:
            throw ApiError(message: 'Not found');
          default:
            throw ApiError.fromJson(errorData);
        }
      } on TypeError catch (_) {
        throw ApiError(message: 'Unsuccessfully tried parsing error message.');
      }
    }
  }
}
