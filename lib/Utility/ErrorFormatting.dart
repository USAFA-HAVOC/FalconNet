import 'package:dio/dio.dart';

void displayError({required String prefix, required Object exception}) {
  if (exception is DioError) {
    var dio = exception;
    print("$prefix Error: Dio Error ${dio.type.toString()}");
    print("Message: ${dio.message}");
    print("Response: ${dio.response.toString()}");
    print("Error: ${dio.error.toString()}");
  }
  else {
    print("$prefix Error: ${exception.toString().split("\n").first}");
  }
}