// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

import 'package:bank_off_time/features/auth/data/models/user_model.dart';


LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  Auth data;
  String message;
  int code;

  LoginResponse({
    required this.data,
    required this.message,
    required this.code,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    data: Auth.fromJson(json["data"]),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
    "code": code,
  };
}

class Auth {
  User user;
  Authorization authorization;

  Auth({
    required this.user,
    required this.authorization,
  });

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
    user: User.fromJson(json["user"]),
    authorization: Authorization.fromJson(json["authorization"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "authorization": authorization.toJson(),
  };
}

class Authorization {
  String token;

  Authorization({
    required this.token,
  });

  factory Authorization.fromJson(Map<String, dynamic> json) => Authorization(
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}
