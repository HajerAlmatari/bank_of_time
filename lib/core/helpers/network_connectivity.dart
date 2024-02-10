import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';


class NetworkConnectivity {

  NetworkConnectivity._();
  static final _instance = NetworkConnectivity._();
  static NetworkConnectivity get instance => _instance;

  final Connectivity connectivity = Connectivity();

  Future<bool> check() async{
    var connectivityResult = await (Connectivity().checkConnectivity());

    if(connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.bluetooth|| connectivityResult == ConnectivityResult.mobile){
      try {
        final result = await InternetAddress.lookup("google.com");
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          return true;
        }
      } on SocketException catch (_) {
        return false;
      }
    }

    return false;
  }


}