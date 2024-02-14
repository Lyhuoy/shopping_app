import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyle {
  static TextStyle header = const TextStyle(
    fontSize: 17,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  static TextStyle headerBlack = const TextStyle(
    fontSize: 17,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );

  static TextStyle title = const TextStyle(
    fontSize: 15,
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w500,
  );
  static TextStyle subtitle = const TextStyle(
    fontSize: 13,
    color: AppColors.textSecondary,
    fontWeight: FontWeight.w500,
  );

  static TextStyle body = const TextStyle(
    fontSize: 13,
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w300,
  );

  static TextStyle label = const TextStyle(
    fontSize: 13,
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w300,
  );

  static TextStyle caption = const TextStyle(
    fontSize: 13,
    color: AppColors.textSecondary,
    fontWeight: FontWeight.w300,
  );

   static TextStyle titleCaption = const TextStyle(
    fontSize: 9,
    color: AppColors.textTitleCaption,
    fontWeight: FontWeight.w300,
  );

  static TextStyle subTitleCaption = const TextStyle(
    fontSize: 15,
    color: AppColors.textBoldStyle,
    fontWeight: FontWeight.w600,
  );
   static TextStyle subTitleF12 = const TextStyle(
    fontSize: 12,
    color: AppColors.textSubTitleF12,
    fontWeight: FontWeight.w400,
  );
  
}
