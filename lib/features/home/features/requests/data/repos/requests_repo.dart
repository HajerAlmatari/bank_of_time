import 'package:bank_off_time/core/data/app_urls.dart';
import 'package:bank_off_time/core/data/network/base_api_services.dart';
import 'package:bank_off_time/core/models/error_model.dart';
import 'package:bank_off_time/features/home/features/requests/data/models/request_model.dart';
import 'package:dio/dio.dart';

class RequestsRepo{

  final BaseApiServices _apiServices;
  RequestsRepo(this._apiServices);


  Future<List<RequestModel>?>? getAllRequests({required int userId})async{

    try{
      Response? response = await _apiServices.getGetApiResponse(AppUrls.userRequests(userId: userId));
      final baseResponseModel = baseResponseModelFromJson(response!.data);

      if( baseResponseModel.code == 200){

        final List list = baseResponseModel.data as List;

        return list.map((e) => RequestModel.fromMap(e)).toList();
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