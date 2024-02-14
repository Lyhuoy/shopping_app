import 'package:shoppingapp/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLabelBadge extends StatelessWidget {
  const AppLabelBadge({
    super.key,
    required this.title,
    this.child,
    this.color,
    this.backgroundColor,
    this.titleSize = 10,
    this.padding,
  });
  final String title;
  final Widget? child;
  final Color? color;
  final Color? backgroundColor;
  final double titleSize;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          EdgeInsets.symmetric(
              horizontal: 5,
              vertical: Get.locale?.languageCode == LanguageCode.khmer ? 3 : 5),
      decoration: BoxDecoration(
        color: backgroundColor ??
            color?.withOpacity(0.1) ??
            AppColors.pageBackground,
        borderRadius: BorderRadius.circular(AppSizeStyle.defaultRoundSm),
      ),
      child: child ??
          Text(
            title,
            style: TextStyle(
              color: color,
              fontSize: titleSize,
              height: Get.locale?.languageCode == LanguageCode.khmer ? 1.4 : null,
            ),
          ),
    );
  }
}
