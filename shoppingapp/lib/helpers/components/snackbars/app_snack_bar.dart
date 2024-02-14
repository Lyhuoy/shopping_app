import 'package:shoppingapp/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_error_message_snack_bar.dart';

class AppSnackBar {
  static GetSnackBar appGetSnackBar(
      bool isSuccess, String title, String message, int duration,
      {DismissDirection direction = DismissDirection.down,
      SnackBarBehavior behavior = SnackBarBehavior.fixed}) {
    return GetSnackBar(
        title: "Title",
        message: "message",
        backgroundColor: Colors.white,
        margin: const EdgeInsets.all(20),
        borderRadius: 15,
        animationDuration: const Duration(milliseconds: 200),
        boxShadows: const [
          BoxShadow(
              color: Color(0x20000000), blurRadius: 10.2, spreadRadius: 2.5),
        ],
        duration: Duration(seconds: duration),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        icon: isSuccess
            ? const Icon(
                Icons.check_circle_outline_rounded,
                color: AppColors.success,
              )
            : const Icon(
                Icons.warning_amber_rounded,
                color: AppColors.error,
              ),
        titleText: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSuccess ? AppColors.success : AppColors.error),
        ),
        messageText: Text(
          message,
          maxLines: 10,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: const TextStyle(color: Colors.black),
        ));
  }

  Future<GetSnackBar> errorMessageState(bool isSuccess, String title,
      String message, Color stateColor, int duration,
      {bool showProgress = false,
      DismissDirection direction = DismissDirection.down,
      SnackBarBehavior behavior = SnackBarBehavior.fixed}) async {
    return GetSnackBar(
        padding: const EdgeInsets.all(0.0),
        dismissDirection: direction,
        isDismissible: isSuccess,
        duration: Duration(seconds: duration),
        backgroundColor: Colors.black.withOpacity(0.3),
        snackPosition: SnackPosition.TOP,
        snackStyle: SnackStyle.GROUNDED,
        userInputForm: Form(
            child: AppErrorMessageSnackBar(
          showProgress: showProgress,
          netState: isSuccess,
          title: title,
          message: message,
          stateColor: stateColor,
        )));
  }

  static void showSnackBarTop({required String message, Color color =AppColors.darkGrey, Color textColor =Colors.white}) {
    if(Get.isSnackbarOpen){
      Get.closeCurrentSnackbar();
    }
    Get.showSnackbar(GetSnackBar(
      snackPosition: SnackPosition.TOP,
      borderRadius: 32,
      isDismissible: false,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      duration: const Duration(seconds: 2),
      animationDuration: const Duration(milliseconds: 100),
      backgroundColor: color,
      messageText: Center(
        child: Text(
          message,
          style: TextStyle(color: textColor),
        ),
      ),
    ));
  }
}
