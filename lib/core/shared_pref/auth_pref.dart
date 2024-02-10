import 'package:bank_off_time/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPref{

  static const String _idKey = "idPref";
  static const String _nameKey = "namePref";
  static const String _phoneKey = "phonePref";
  static const String _emailKey = "emailPref";
  static const String _userTypeKey = "userTypePref";
  static const String _statusKey = "statusPref";
  static const String _descriptionKey = "descriptionPref";
  static const String _isLoggedInKey = "isLoggedInPref";

  static void saveAuthUser(User userModel) async{

    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setInt(_idKey, userModel.id);
    pref.setString(_nameKey, userModel.name);
    pref.setString(_phoneKey, userModel.phone);
    pref.setString(_emailKey, userModel.email);
    pref.setInt(_userTypeKey, userModel.userType);
    pref.setInt(_statusKey, userModel.status);
    pref.setString(_descriptionKey, userModel.description??"");

  }

  static Future<void> deletedLoggedInUser()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(_idKey);
    pref.remove(_nameKey);
    pref.remove(_phoneKey);
    pref.remove(_emailKey);
    pref.remove(_userTypeKey);
    pref.remove(_statusKey);
    pref.remove(_descriptionKey);
  }

  static Future<User> getLoggedInUser()async{

    SharedPreferences pref = await SharedPreferences.getInstance();
    return User(
        id: pref.getInt(_idKey) ?? 0,
        name: pref.getString(_nameKey) ?? "",
        description: pref.getString(_descriptionKey) ?? "",
        email: pref.getString(_emailKey) ?? "",
        phone: pref.getString(_phoneKey) ?? "",
        status: pref.getInt(_statusKey) ?? 0,
        userType:  pref.getInt(_userTypeKey) ?? 0,
    );

  }

  static void setIsLoggedIn(bool value)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(_isLoggedInKey, value);
  }
  static Future<bool> getIsLoggedIn() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(_isLoggedInKey) ?? false;
  }

}