// To parse this JSON data, do
//
//     final errorModel = errorModelFromJson(jsonString);

import 'dart:convert';

ErrorModel errorModelFromJson(String str) => ErrorModel.fromMap(json.decode(str));

String errorModelToJson(ErrorModel data) => json.encode(data.toJson());

class ErrorModel {
  dynamic data;
  String message;
  int code;

  ErrorModel({
    required this.data,
    required this.message,
    required this.code,
  });

  factory ErrorModel.fromMap(Map<String, dynamic> map) => ErrorModel(
    data: map["data"],
    message: map["message"],
    code: map["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "message": message,
    "code": code,
  };
}
