import 'package:flutter/material.dart';
import 'package:shoppingapp/core.dart';


class AppLoading {

  static CircularProgressIndicator indicatorWidget({
    Color? indidcateColor,
    Color? indidcateBackgroundColor,
    double? indidcateWidth,
  }) {
    return CircularProgressIndicator(
      color: indidcateColor ?? AppColors.primary,
      backgroundColor:
          indidcateBackgroundColor ?? Colors.white.withOpacity(0.3),
      strokeWidth: indidcateWidth ?? 5,
    );
  }
}
