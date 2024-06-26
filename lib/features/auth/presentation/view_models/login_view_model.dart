import 'package:bank_off_time/core/data/network/network_api_services.dart';
import 'package:bank_off_time/core/helpers/network_connectivity.dart';
import 'package:bank_off_time/core/providers/session_provider.dart';
import 'package:bank_off_time/core/utils/cherry_toast_util.dart';
import 'package:bank_off_time/features/auth/data/models/user_model.dart';
import 'package:bank_off_time/features/auth/data/repos/auth_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginViewModel = ChangeNotifierProvider.autoDispose((ref) {
  return  LoginViewModel(ref);
});



class LoginViewModel with ChangeNotifier {
  final Ref ref;
  final AuthRepository _myRepo = AuthRepository(NetworkApiServices());

  LoginViewModel(this.ref);




  bool _isLoading = false;

  void _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  bool showPassword = false;
  void showHidePassword(){
    showPassword = !showPassword;
    notifyListeners();
  }

  bool obsecurePassword = true;
  void showHideChangePassword(){
    obsecurePassword = !obsecurePassword;
    notifyListeners();
  }

  void loginWithUserNameAndPassword(TextEditingController email, TextEditingController password, BuildContext context) async {
    if (await NetworkConnectivity.instance.check()) {
      try {
        _setIsLoading(true);

        Map<String, String> data = {
          "email": email.text,
          "password": password.text
        };

        User? user = await _myRepo.login(data, context);
        _setIsLoading(false);

        if(user!=null){
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
