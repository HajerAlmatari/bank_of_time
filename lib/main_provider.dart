import 'package:bank_off_time/core/helpers/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainProvider = ChangeNotifierProvider<MainProvider>((ref) {
  return MainProvider();
});

class MainProvider extends ChangeNotifier{

  Locale locale = const Locale("en");

  MainProvider(){
    setLocaleFromSharedPref();
  }

  void setLocaleFromSharedPref()async{
    final String localeString = await SharedPref.getLocale();
    locale = Locale(localeString);
    notifyListeners();
  }

  void setLocale(String value)async{
    locale = Locale(value);
    await SharedPref.setLocale(value);
    notifyListeners();
  }


}