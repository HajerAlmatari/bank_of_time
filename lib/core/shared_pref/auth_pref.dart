import 'package:bank_off_time/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPref {
  static const String _idKey = "idPref";
  static const String _nameKey = "namePref";
  static const String _emailKey = "emailPref";
  static const String _userNameKey = "userNamePref";
  static const String _userBalanceKey = "userBalancePref";
  static const String _userStatusKey = "userStatusPref";
  static const String _userTypeKey = "userTypePref";
  static const String _isLoggedInKey = "isLoggedInPref";

  static void saveAuthUser(User userModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();


    pref.setInt(_idKey, userModel.id);
    pref.setString(_nameKey, userModel.name);
    pref.setString(_emailKey, userModel.email);
    pref.setString(_userNameKey, userModel.username);
    pref.setDouble(_userBalanceKey, userModel.balance??0.0);
    pref.setInt(_userStatusKey, userModel.status ?? 0);
    pref.setInt(_userTypeKey, userModel.type ?? 0);
  }

  static Future<void> deletedLoggedInUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(_idKey);
    pref.remove(_nameKey);
    pref.remove(_emailKey);
    pref.remove(_userNameKey);
  }

  static Future<User> getLoggedInUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return User(
      id: pref.getInt(_idKey) ?? 0,
      name: pref.getString(_nameKey) ?? "",
      email: pref.getString(_emailKey) ?? "",
      username: pref.getString(_userNameKey) ?? "",
      balance: pref.getDouble(_userBalanceKey) ?? 0.0,
      status: pref.getInt(_userStatusKey) ?? 0,
      type: pref.getInt(_userTypeKey) ?? 0,
      password: "",
    );
  }

  static void setIsLoggedIn(bool value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(_isLoggedInKey, value);
  }

  static Future<bool> getIsLoggedIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(_isLoggedInKey) ?? false;
  }
}
