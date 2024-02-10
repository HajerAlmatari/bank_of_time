


import 'package:bank_off_time/core/data/response/status.dart';

class ApiResponse<T>{

  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);


  ApiResponse.loading(): status = Status.loading;
  ApiResponse.completed(): status = Status.complete;
  ApiResponse.error(): status = Status.error;

  @override
  String toString() {
    return 'Status :  $status \nData: $data \nMessage: $message';
  }
}