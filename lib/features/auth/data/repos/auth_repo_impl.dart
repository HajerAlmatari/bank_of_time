import 'dart:convert';

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
      final baseResponseModel = baseResponseModelFromJson(response!.data);

      if(baseResponseModel.code == 201 || baseResponseModel.code == 200){

        return userFromJson(jsonEncode(baseResponseModel.data));
      }
      ToastUtil.showError(baseResponseModel.message,context);


      return null;
    }catch(e){


      if(e is DioException){
        Response? response = e.response;
        final BaseResponseModel errorModel = baseResponseModelFromJson(response!.data);
        //
        ToastUtil.showError(errorModel.message,context);
      }
      rethrow;
    }
  }


  Future<User?> register(dynamic data, BuildContext context)async{

    try{
      Response? response = await _apiServices.getPostApiResponse(AppUrls.registerUrl, data);
      final baseResponseModel = baseResponseModelFromJson(response!.data);

      if(baseResponseModel.code == 201 || baseResponseModel.code == 200){

        return userFromJson(jsonEncode(baseResponseModel.data));
      }

      ToastUtil.showError(baseResponseModel.message,context);


      return null;
    }catch(e){


      if(e is DioException){
        // ToastUtil.showError("Wrong Email or Password", context);
        Response? response = e.response;
        final BaseResponseModel errorModel = baseResponseModelFromJson(response!.data);
        //
        ToastUtil.showError(errorModel.message,context);
      }
      rethrow;
    }
  }


}