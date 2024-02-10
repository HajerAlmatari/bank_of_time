import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';

abstract class ToastUtil {
  static void showSuccess(String message, BuildContext context) {
    CherryToast.success(
      title: Text(
        message,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    ).show(context);
  }

  static void showError(String title, BuildContext context) {
    CherryToast.error(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),

      // action: Text("Display information", style: TextStyle(color: Colors.black)),

      actionHandler: () {
        // print("Action button pressed");
      },
    ).show(context);
  }

  static void showInfo(String title, BuildContext context) {
    CherryToast.info(
      title: Text(title, style: const TextStyle(color: Colors.black)),
      actionHandler: () {},
    ).show(context);
  }
}
