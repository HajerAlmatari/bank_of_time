import 'package:bank_off_time/core/data/network/network_api_services.dart';
import 'package:bank_off_time/core/helpers/network_connectivity.dart';
import 'package:bank_off_time/core/utils/cherry_toast_util.dart';
import 'package:bank_off_time/features/auth/data/repos/auth_repo_impl.dart';
import 'package:bank_off_time/features/home/features/order/data/models/order_model.dart';
import 'package:bank_off_time/features/home/features/order/data/repos/order_repo.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final orderViewModel = ChangeNotifierProvider.autoDispose.family<OrderViewModel ,OrderModel>((ref, orderModel) {
  return  OrderViewModel(ref, orderModel);
});



class OrderViewModel with ChangeNotifier {
  final Ref ref;
  final OrderRepo _myRepo = OrderRepo(NetworkApiServices());

  OrderModel orderModel;
  OrderViewModel(this.ref, this.orderModel);




  bool _isLoading = false;
  void _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  bool get isLoading => _isLoading;


  void sendOrder(BuildContext context) async {
    if (await NetworkConnectivity.instance.check()) {
      try {
        _setIsLoading(true);

        orderModel.price = double.parse(textEditingControllers.priceController.text);
        orderModel.date = textEditingControllers.dateController.text;

        bool result = await _myRepo.sendOrder(orderModel);
        _setIsLoading(false);

        if(result){
          Navigator.pop(context);
          ToastUtil.showSuccess(AppLocalizations.of(context)!.order_sent_successfully, context);

        }

      } catch (e) {
        _setIsLoading(false);
        rethrow;
      }
    } else {
      ToastUtil.showInfo("There is no internet connection", context);
    }
  }

  final textEditingControllers = (
  dateController: TextEditingController(),
  priceController: TextEditingController(),
  );

  final focusNodes = (
  dateFocusNode: FocusNode(),
  priceFocusNode: FocusNode(),
  );

  final formKey = GlobalKey<FormState>();


}
