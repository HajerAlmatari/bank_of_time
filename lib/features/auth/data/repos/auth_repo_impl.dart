import 'package:bank_off_time/core/data/app_urls.dart';
import 'package:bank_off_time/core/data/network/base_api_services.dart';
import 'package:bank_off_time/core/models/error_model.dart';
import 'package:bank_off_time/core/utils/cherry_toast_util.dart';
import 'package:bank_off_time/features/auth/data/models/login_model.dart';
import 'package:bank_off_time/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AuthRepository{

  final BaseApiServices _apiServices;
  AuthRepository(this._apiServices);

  Future<User?> login(dynamic data, BuildContext context)async{

    try{
      Response? response = await _apiServices.getPostApiResponse(AppUrls.loginUrl, data);
      final loginResponse = loginResponseFromJson(response!.data);
      return loginResponse.data.user;
    }catch(e){


      if(e is DioException){
        // ToastUtil.showError("Wrong Email or Password", context);
        // print("the error is $e");
        // print("the error response is ${e.response}");
        Response? response = e.response;
        final ErrorModel errorModel = errorModelFromJson(response!.data);
        //
        ToastUtil.showError(errorModel.message,context);
      }
      rethrow;
    }
  }


  Future<User?> register(dynamic data, BuildContext context)async{

    try{
      Response? response = await _apiServices.getPostApiResponse(AppUrls.registerUrl, data);
      final loginResponse = loginResponseFromJson(response!.data); /// TODO change this
      return loginResponse.data.user; /// TODO change this
    }catch(e){


      if(e is DioException){
        // ToastUtil.showError("Wrong Email or Password", context);
        // print("the error is $e");
        // print("the error response is ${e.response}");
        Response? response = e.response;
        final ErrorModel errorModel = errorModelFromJson(response!.data);
        //
        ToastUtil.showError(errorModel.message,context);
      }
      rethrow;
    }
  }


}