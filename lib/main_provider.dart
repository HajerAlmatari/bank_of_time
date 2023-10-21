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
    changeSelectedOption ( locale == Locale("ar") ? 1 : 2);
    notifyListeners();
  }

  void setLocale()async{
    String value = selectedOption == 1 ? "ar" : "en";
    locale = Locale(value);
    await SharedPref.setLocale(value);
    notifyListeners();
  }

  int selectedOption = 1;

  void changeSelectedOption(int value){
    selectedOption = value;
    notifyListeners();
  }

}