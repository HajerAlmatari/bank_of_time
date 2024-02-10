
abstract class BaseApiServices{
  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> getGetWithDataApiResponse(String url, dynamic data);
  Future<dynamic> getDeleteApiResponse(String url);
  Future<dynamic> getDeleteWithDataApiResponse(String url, dynamic data);
  Future<dynamic> getPostApiResponse(String url, dynamic data);
  Future<dynamic> getPostFormDataApiResponse(String url, dynamic data);
  Future<dynamic> getPutApiResponse(String url, dynamic data);
  Future<dynamic> getPutFormDataApiResponse(String url, dynamic data);
}