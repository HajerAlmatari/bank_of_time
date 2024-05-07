import 'dart:async';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:bank_off_time/core/data/network/network_api_services.dart';
import 'package:bank_off_time/core/helpers/network_connectivity.dart';
import 'package:bank_off_time/core/providers/session_provider.dart';
import 'package:bank_off_time/core/utils/cherry_toast_util.dart';
import 'package:bank_off_time/features/auth/data/models/user_model.dart';
import 'package:bank_off_time/features/auth/data/repos/auth_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final statusViewModel = ChangeNotifierProvider.autoDispose<StatusViewModel>((ref) {
  return StatusViewModel(ref);
});

class StatusViewModel with ChangeNotifier {
  final Ref ref;
  final AuthRepository _myRepo  = AuthRepository(NetworkApiServices());



  StatusViewModel(this.ref) {
    _status = ref.watch(sessionProvider).authUser?.status == 1 ? true : false;
  }

  bool _status = false;

  bool get status => _status;

  void setStatus(BuildContext context,bool value) {
    if (isLoading) {
      return;
    } else {
      _status = value;
      submit(context);
      notifyListeners();
    }
  }

  Future submit(BuildContext context)async{
    if (await NetworkConnectivity.instance.check()) {
      try {
        isLoading = true;

        User? authUser = ref.watch(sessionProvider).authUser;
        authUser?.status = status ? 1 : 0;

        User? user = await _myRepo.updateUser(authUser!, context);
        isLoading = false;


        if (user != null) {
          ToastUtil.showSuccess(AppLocalizations.of(context)!.updated_successfully, context);

          ref.watch(sessionProvider).updateAuthUser(user);
        }
      } catch (e) {
        isLoading = false;

        rethrow;
      }
    } else {
      ToastUtil.showInfo("There is no internet connection", context);
    }
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
