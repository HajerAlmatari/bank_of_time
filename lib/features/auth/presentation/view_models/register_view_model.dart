import 'package:bank_off_time/core/data/network/network_api_services.dart';
import 'package:bank_off_time/core/helpers/network_connectivity.dart';
import 'package:bank_off_time/core/providers/session_provider.dart';
import 'package:bank_off_time/core/utils/cherry_toast_util.dart';
import 'package:bank_off_time/features/auth/data/models/user_model.dart';
import 'package:bank_off_time/features/auth/data/repos/auth_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final registerViewModel = ChangeNotifierProvider.autoDispose((ref) {
  return  RegisterViewModel(ref);
});


class RegisterViewModel with ChangeNotifier {
  final AuthRepository _myRepo  = AuthRepository(NetworkApiServices());

  final Ref ref;
  RegisterViewModel(this.ref);

  bool _isLoading = false;

  void _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  bool showPassword = false;

  void showHidePassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  bool obsecurePassword = true;

  void showHideChangePassword() {
    obsecurePassword = !obsecurePassword;
    notifyListeners();
  }

  void registerNewAccount({
    required TextEditingController email,
    required TextEditingController userName,
    required TextEditingController fullName,
    required TextEditingController password,
    required BuildContext context,
  }) async {
    if (await NetworkConnectivity.instance.check()) {
      try {
        _setIsLoading(true);

        Map<String, String> data = {
          "email": email.text,
          "username": userName.text,
          "name": fullName.text,
          "password": password.text
        };

        User? user = await _myRepo.register(data, context);
        _setIsLoading(false);

        if (user != null) {
          ref.watch(sessionProvider).login(user, context);
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
