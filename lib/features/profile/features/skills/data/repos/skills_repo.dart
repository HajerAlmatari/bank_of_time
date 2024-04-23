import 'dart:convert';

import 'package:bank_off_time/core/data/app_urls.dart';
import 'package:bank_off_time/core/data/network/base_api_services.dart';
import 'package:bank_off_time/core/models/error_model.dart';
import 'package:bank_off_time/core/utils/cherry_toast_util.dart';
import 'package:bank_off_time/features/auth/data/models/user_model.dart';
import 'package:bank_off_time/features/home/data/models/category.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SkillsRepo{

  final BaseApiServices _apiServices;
  SkillsRepo(this._apiServices);


  Future<List<CategoryModel>?>? getCategories()async{

    try{
      Response? response = await _apiServices.getGetApiResponse(AppUrls.categoriesUrl);
      final baseResponseModel = baseResponseModelFromJson(response!.data);

      if( baseResponseModel.code == 200){

        final List list = baseResponseModel.data as List;

        return list.map((e) => CategoryModel.fromMap(e)).toList();
      }


      return null;
    }catch(e){


      if(e is DioException){
        Response? response = e.response;
        final BaseResponseModel errorModel = baseResponseModelFromJson(response!.data);
        //
      }
      rethrow;
    }
  }


  Future<bool> addSkills(dynamic data)async{

    try{
      Response? response = await _apiServices.getPostApiResponse(AppUrls.addSkillUrl, data);

      if( response!.statusCode == 200 || response.statusCode == 201){

        return true;
      }


      return false;
    }catch(e){

      return false;
    }
  }


  Future<User?> userWithSkills(int userId)async{

    try{
      Response? response = await _apiServices.getGetApiResponse(AppUrls.userWithSkills(userId: userId));
      final baseResponseModel = baseResponseModelFromJson(response!.data);

      if(baseResponseModel.code == 201 || baseResponseModel.code == 200){

        return userFromJson(jsonEncode(baseResponseModel.data));
      }


      return null;
    }catch(e){


      if(e is DioException){
        Response? response = e.response;
        final BaseResponseModel errorModel = baseResponseModelFromJson(response!.data);
      }
      rethrow;
    }
  }

  Future<List<User>?>? allUsersOfSpecificSkill(int skillId)async{

    try{
      Response? response = await _apiServices.getGetApiResponse(AppUrls.allUsersOfSpecificSkill(skillId: skillId));
      final baseResponseModel = baseResponseModelFromJson(response!.data);

      if( baseResponseModel.code == 200){

        final List list = baseResponseModel.data as List;

        return list.map((e) => User.fromMap(e)).toList();
      }


      return null;
    }catch(e){


      if(e is DioException){
        Response? response = e.response;
        final BaseResponseModel errorModel = baseResponseModelFromJson(response!.data);
        //
      }
      rethrow;
    }
  }



}