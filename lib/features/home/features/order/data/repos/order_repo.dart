import 'package:bank_off_time/core/data/app_urls.dart';
import 'package:bank_off_time/core/data/network/base_api_services.dart';
import 'package:bank_off_time/core/models/error_model.dart';
import 'package:bank_off_time/features/home/features/order/data/models/order_model.dart';
import 'package:bank_off_time/features/home/features/requests/data/models/request_model.dart';
import 'package:dio/dio.dart';

class OrderRepo {
  final BaseApiServices _apiServices;

  OrderRepo(this._apiServices);

  Future<bool> sendOrder(OrderModel order) async {
    try {
      Response? response = await _apiServices.getPostApiResponse(AppUrls.sendOrder, order.toMap());
      final baseResponseModel = baseResponseModelFromJson(response!.data);

      if (baseResponseModel.code == 200 || baseResponseModel.code == 201) {
        return true;
      }

      return false;
    } catch (e) {
      if (e is DioException) {
        Response? response = e.response;
        final BaseResponseModel errorModel = baseResponseModelFromJson(response!.data);
        //
      }
      rethrow;
    }
  }

  Future<bool> acceptRequest(RequestModel requestModel) async {
    try {
      Response? response = await _apiServices.getPutApiResponse(
        AppUrls.acceptRequest(requestId: requestModel.id),
        requestModel.toAcceptRequest(),
      );
      final baseResponseModel = baseResponseModelFromJson(response!.data);

      if (baseResponseModel.code == 200 || baseResponseModel.code == 201) {
        return true;
      }

      return false;
    } catch (e) {
      if (e is DioException) {
        Response? response = e.response;
        final BaseResponseModel errorModel = baseResponseModelFromJson(response!.data);
        //
      }
      rethrow;
    }
  }
}
