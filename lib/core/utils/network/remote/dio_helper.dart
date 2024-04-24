// ignore_for_file: depend_on_referenced_packages, body_might_complete_normally_catch_error, avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'http://api.geoapify.com/v2/',
        receiveDataWhenStatusError: true,
        headers: {
          "Accept": "application/json",
        }));
  }

  Future<Response> getData({
    required String url,
    var data,
  }) async {
    print(url);
    return await dio
        .get(
      url,
      data: data,
    ).catchError((e) {
      SnackBar(content: Text('${e.response?.data['message']}'));
      print(e.toString());
    });
  }

  Future<Response> postDataWithAuth(
      {required String url,
      required Map<String, dynamic> data,
      String? token}) async {
    return await dio.post(
      url,
      data: json.encode(data),
      options: Options(),
    );
  }

  static Future<Response> putData(
      {required String baseURL,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String lang = "en",
      String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? ''
    };
    return await dio.put(baseURL, queryParameters: query, data: data);
  }

  Future<Response> deletData(
      {required String path, Map<String, dynamic>? body, String? token}) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    return await dio.delete(path, data: body).catchError((e) {
      if (e.response != null) {
        print(e.response?.data);
      } else {
        print(e.message);
      }
    });
  }
}
