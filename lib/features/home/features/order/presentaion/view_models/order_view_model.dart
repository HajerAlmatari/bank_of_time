import 'package:bank_off_time/core/data/network/network_api_services.dart';
import 'package:bank_off_time/features/auth/data/repos/auth_repo_impl.dart';
import 'package:bank_off_time/features/home/features/order/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final orderViewModel = ChangeNotifierProvider.autoDispose.family<ChangeNotifier ,OrderModel>((ref, orderModel) {
  return  OrderViewModel(ref, orderModel);
});



class OrderViewModel with ChangeNotifier {
  final Ref ref;
  final AuthRepository _myRepo = AuthRepository(NetworkApiServices());

  OrderViewModel(this.ref, OrderModel orderModel);




  bool _isLoading = false;
  void _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  bool get isLoading => _isLoading;



}
