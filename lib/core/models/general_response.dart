// import 'dart:convert';
//
// GeneralResponse generalResponseFromJson(String str) => GeneralResponse.fromMap(json.decode(str));
//
// String generalResponseToJson(GeneralResponse data) => json.encode(data.toMap());
//
// class GeneralResponse<T> {
//   Object? data;
//   String message;
//   int status;
//
//   GeneralResponse({
//     required this.data,
//     required this.message,
//     required this.status,
//   });
//
//   factory GeneralResponse.fromMap(Map<String, dynamic> json) => GeneralResponse(
//     data: json["data"],
//     message: json["message"]??"",
//     status: json["status"]??500,
//   );
//
//   Map<String, dynamic> toMap() => {
//     "data": data,
//     "message": message,
//     "status": status,
//   };
// }