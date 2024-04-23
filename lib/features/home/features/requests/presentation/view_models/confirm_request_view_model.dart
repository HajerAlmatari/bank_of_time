import 'package:bank_off_time/core/data/network/network_api_services.dart';
import 'package:bank_off_time/core/helpers/network_connectivity.dart';
import 'package:bank_off_time/core/utils/cherry_toast_util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:bank_off_time/features/home/features/order/data/repos/order_repo.dart';
import 'package:bank_off_time/features/home/features/requests/data/models/request_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final confirmRequestViewModel = ChangeNotifierProvider.autoDispose.family<ConfirmRequestViewModel ,RequestModel>((ref, requestModel) {
  return  ConfirmRequestViewModel(ref, requestModel);
});



class ConfirmRequestViewModel with ChangeNotifier {
  final Ref ref;
  final OrderRepo _myRepo = OrderRepo(NetworkApiServices());

  RequestModel requestModel;
  ConfirmRequestViewModel(this.ref, this.requestModel);




  bool _isLoading = false;
  void _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  bool get isLoading => _isLoading;


  void acceptRequest(BuildContext context) async {
    if (await NetworkConnectivity.instance.check()) {
      try {
        _setIsLoading(true);


        bool result = await _myRepo.acceptRequest(requestModel);
        _setIsLoading(false);

        if(result){
          ToastUtil.showSuccess(AppLocalizations.of(context)!.request_accepted_successfully, context);
          Navigator.pop(context, true);

        }

      } catch (e) {
        _setIsLoading(false);
        rethrow;
      }
    } else {
      ToastUtil.showInfo("There is no internet connection", context);
    }
  }

}
