import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Validator {
  static bool validEmail(String email) {
    final bool emailValid =
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    return emailValid;
  }

  static bool validPassword(String password) {
    final bool passwordValid = RegExp(r"^.{8,}$").hasMatch(password);
    return passwordValid;
  }

  static String invalidPasswordText(String password) {
    if (!RegExp(r"^.{8,}$").hasMatch(password)) {
      return "password must be at least 8 char";
    } else {
      return "";
    }
  }

  static bool validNumber(dynamic text) {
    final bool vaildNumber = RegExp(r'^[1-9]$').hasMatch(text);
    return vaildNumber;
  }

  static bool validText(dynamic text) {
    final bool vaildNumber = RegExp(
            r'^[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z]+[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z-_\ ]*$')
        .hasMatch(text);
    return vaildNumber;
  }

  static bool isValidArabic(String text) {
    final RegExp arabicRegex = RegExp(r'^[^\u0041-\u005A\u0061-\u007A]*$');
    return arabicRegex.hasMatch(text);
  }

  static bool isValidEnglish(String text) {
    final RegExp englishRegex = RegExp(r'^[^\u0600-\u06FF]*$');
    return englishRegex.hasMatch(text);
  }

  static bool isValidPhone(String text) {
    final RegExp englishRegex = RegExp(r'^\+?\d+$');
    return englishRegex.hasMatch(text);
  }

  static bool validPassportNumber(String text) {
    return text.length >= 7 && text.length <= 12;
  }
}
