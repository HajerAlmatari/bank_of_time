// To parse this JSON data, do
//
//     final BaseResponseModel = BaseResponseModelFromJson(jsonString);

import 'dart:convert';

BaseResponseModel baseResponseModelFromJson(String str) => BaseResponseModel.fromMap(json.decode(str));

String baseResponseModelToJson(BaseResponseModel data) => json.encode(data.toJson());

class BaseResponseModel {
  dynamic data;
  String message;
  int code;

  BaseResponseModel({
    required this.data,
    required this.message,
    required this.code,
  });

  factory BaseResponseModel.fromMap(Map<String, dynamic> map) => BaseResponseModel(
    data: map["data"],
    message: map["message"],
    code: map["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "message": message,
    "status": code,
  };
}
