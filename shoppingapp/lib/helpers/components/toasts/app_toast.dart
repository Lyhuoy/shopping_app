import 'package:flutter/material.dart';
import 'package:shoppingapp/core.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppToast {
  static Future<bool?> show(
    String message, {
    double? fontSize,
    ToastGravity? gravity,
    Color? backgroundColor,
    Color? textColor,
  }) async {
    return await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity ?? ToastGravity.TOP,
      backgroundColor: backgroundColor ?? Colors.white,
      textColor: textColor ?? AppColors.primary,
    );
  }

  static Future<bool?> cancel() async {
    return await Fluttertoast.cancel();
  }
}
