import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{

  static Future<String> getLocale()async{
    final pref = await SharedPreferences.getInstance();
    return pref.getString('locale') ?? 'en';
  }


  static Future<void> setLocale(String locale)async{
    final pref = await SharedPreferences.getInstance();
    pref.setString('locale', locale);
  }

}