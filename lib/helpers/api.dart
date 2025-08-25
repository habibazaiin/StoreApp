import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class Api {
  Dio dio = Dio();
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    Response response = await dio.get(url, options: Options(headers: headers));

    if (response.statusCode == 200) {
      List<dynamic> list = response.data;
      return list;
    } else {
      throw Exception(
        'there was an error with status code ${response.statusCode}',
      );
    }
  }

  Future<dynamic> post({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    Response response = await dio.post(
      url,
      data: body,
      options: Options(headers: headers),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> data = response.data;
      return data;
    } else {
      throw Exception(
        'there was an error with status code ${response.statusCode} and body ${response.data}',
      );
    }
  }

  Future<dynamic> put({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    Response response = await dio.put(
      url,
      data: body,
      options: Options(headers: headers),
    );
    print('url: $url body: $body headers: $headers' );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      return data;
    } else {
      throw Exception(
        'there was an error with status code ${response.statusCode} and body ${response.data}',
      );
    }
  }
}
