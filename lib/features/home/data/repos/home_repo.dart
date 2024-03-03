import 'dart:convert';

import 'package:bank_off_time/core/data/app_urls.dart';
import 'package:bank_off_time/core/data/network/base_api_services.dart';
import 'package:bank_off_time/core/models/error_model.dart';
import 'package:bank_off_time/features/home/data/models/category.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeRepository{

  final BaseApiServices _apiServices;
  HomeRepository(this._apiServices);


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



}