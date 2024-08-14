// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';

class DioHelper {
  final baseUrl = 'https://travego-z86d.onrender.com/api/';
  final Dio dio;

  DioHelper(this.dio);

  Future<Response> getData({
    required String endPoint,
    String? token,
    Map<String, dynamic>? query,
    String lang = "en",
    String? contenttype,
    String? accept,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'lang': lang,
    };
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    return await dio
        .get('$baseUrl$endPoint',
            queryParameters: query,
            data: query,
            options: Options(
              extra: query,
              headers: headers,
            ))
        .timeout(const Duration(milliseconds: 200000));
  }

  Future<Response> postData(
      {required String endPoint,
      required Map<String, dynamic> data,
      String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    return dio.post('$baseUrl$endPoint',
        data: data,
        options: Options(
            receiveDataWhenStatusError: true,
            sendTimeout: const Duration(milliseconds: 30000),
            receiveTimeout: const Duration(milliseconds: 30000),
            headers: headers));
  }

  Future<Response> putData(
      {required String endPoint,
      required Map<String, dynamic> data,
      String lang = "en",
      String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': 'Bearer $token'
    };
    return await dio.put('$baseUrl$endPoint', data: data);
  }

  Future<Response> deleteData(
      {required String endPoint,
      Map<String, dynamic>? data,
      String? token}) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    return await dio.delete('$baseUrl$endPoint',
        data: data,
        options: Options(
          sendTimeout: const Duration(milliseconds: 10000),
          receiveTimeout: const Duration(milliseconds: 10000),
        ));
  }
}
