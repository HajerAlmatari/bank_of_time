import 'package:bank_off_time/core/shared_pref/auth_pref.dart';
import 'package:bank_off_time/features/auth/data/models/user_model.dart';
import 'package:bank_off_time/features/auth/presentation/views/login_view.dart';
import 'package:bank_off_time/features/main/presentation/view/main_view.dart';
import 'package:flutter/material.dart';

class SessionProvider with ChangeNotifier{

  SessionProvider(){
    checkIsLoggedIn();
    _setAuthUserFromPref();
  }

  bool _isLoggedIn = false;
  void checkIsLoggedIn()async{
    _isLoggedIn = await AuthPref.getIsLoggedIn();
    notifyListeners();
  }
  void _setIsLoggedIn(bool value)async{
    _isLoggedIn = value;
    AuthPref.setIsLoggedIn(value);
    notifyListeners();
  }
  bool get isLoggedIn => _isLoggedIn;


  User? authUser;
  void _setAuthUserFromPref() async{
    authUser = await AuthPref.getLoggedInUser();
    notifyListeners();
  }
  void _setAuthUser(User user)async{
    AuthPref.saveAuthUser(user);
    authUser = user;
    notifyListeners();
  }



  void login(User user, BuildContext context){

    _setIsLoggedIn(true);
    _setAuthUser(user);
    AuthPref.saveAuthUser(user);
    notifyListeners();
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (builder) => MainView()), (route) => false);
  }

  void logout(BuildContext context)async{
    _setIsLoggedIn(false);
    authUser = null;
    AuthPref.deletedLoggedInUser();
    notifyListeners();
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (builder) => const LoginView()), (route) => false);

  }


}