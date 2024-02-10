import 'dart:convert';
import 'dart:io';
import 'package:bank_off_time/core/data/app_exceptions.dart';
import 'package:bank_off_time/core/data/network/base_api_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    Response jsonResponse;
    Dio dio = await getApiClient();

    try {
      final response = await dio
          .get(
            url,
            options: Options(
              responseType: ResponseType.plain,
            ),
          )
          .timeout(const Duration(seconds: 60));
      jsonResponse = response;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return jsonResponse;
  }

  @override
  Future getDeleteApiResponse(String url) async {
    Response jsonResponse;
    Dio dio = await getApiClient();

    try {
      final response = await dio
          .delete(
            url,
            options: Options(
              responseType: ResponseType.plain,
            ),
          )
          .timeout(const Duration(seconds: 60));
      jsonResponse = response;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return jsonResponse;
  }

  @override
  Future<dynamic> getPostApiResponse(String url, data) async {
    Response? jsonResponse;
    Dio dio = await getApiClient();

    try {
      Response response = await dio
          .post(
            url,
            data: jsonEncode(data),
            options: Options(
              responseType: ResponseType.plain,
            ),
          )
          .timeout(const Duration(seconds: 60));

      if (response.statusCode == 201 || response.statusCode == 200) {
      } else {}

      jsonResponse = response;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return jsonResponse;
  }

  @override
  Future<dynamic> getPostFormDataApiResponse(String url, data) async {
    debugPrint("data is $data");
    Response? jsonResponse;
    Dio dio = await getApiClient();

    try {
      Response response = await dio
          .post(
            url,
            data: data,
            options: Options(
                responseType: ResponseType.plain,
                headers: {'Content-Type': 'multipart/form-data'}),
          )
          .timeout(const Duration(seconds: 60));

      jsonResponse = response;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return jsonResponse;
  }

  @override
  Future<dynamic> getPutFormDataApiResponse(String url, data) async {
    debugPrint("data is $data");
    Response? jsonResponse;
    Dio dio = await getApiClient();

    try {
      Response response = await dio
          .put(
            url,
            data: data,
            options: Options(
                responseType: ResponseType.plain,
                headers: {'Content-Type': 'multipart/form-data'}),
          )
          .timeout(const Duration(seconds: 60));

      jsonResponse = response;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return jsonResponse;
  }

  @override
  Future getPutApiResponse(String url, data) async {
    Response? jsonResponse;
    Dio dio = await getApiClient();

    try {
      Response response = await dio
          .put(
            url,
            data: jsonEncode(data),
            options: Options(
              responseType: ResponseType.plain,
            ),
          )
          .timeout(const Duration(seconds: 60));

      jsonResponse = response;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return jsonResponse;
  }

  @override
  Future getDeleteWithDataApiResponse(String url, data) async {
    Response? jsonResponse;
    Dio dio = await getApiClient();

    try {
      Response response = await dio
          .delete(
            url,
            data: jsonEncode(data),
            options: Options(
              responseType: ResponseType.plain,
            ),
          )
          .timeout(const Duration(seconds: 60));

      jsonResponse = response;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return jsonResponse;
  }

  Future<Dio> getApiClient() async {
    Dio dio = Dio();
    // String? token = await TokenPref.getToken();
    dio.interceptors.clear();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          // if (token != null && token != '') {
          //   request.headers['Authorization'] = 'Bearer $token';
          // }
          request.headers['Content-Type'] = 'application/json';
          return handler.next(request);
        },
      ),
    );
    return dio;
  }

  @override
  Future getGetWithDataApiResponse(String url, data) async{
    Response? jsonResponse;
    Dio dio = await getApiClient();

    try {
      Response response = await dio
          .get(
        url,
        data: jsonEncode(data),
        options: Options(
          responseType: ResponseType.plain,
        ),
      )
          .timeout(const Duration(seconds: 60));

      if (response.statusCode == 201 || response.statusCode == 200) {
      } else {}

      jsonResponse = response;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return jsonResponse;
  }
}
