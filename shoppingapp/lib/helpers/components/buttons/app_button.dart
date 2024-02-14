import 'package:flutter/material.dart';
import 'package:shoppingapp/core.dart';
import 'package:huor_progress_indicators/huor_progress_indicators.dart';

class AppButton {
  static final _style = AppButtonStyle();
  static final _appButton = AppButton();

  static Widget circle({
    VoidCallback? onPressed,
    required IconData iconData,
    double? iconSize,
    double? paddingSize,
    String? label,
    Color? color,
    Color? iconColor,
    Color? labelColor,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onPressed,
          splashColor: Colors.white.withOpacity(0.4),
          child: Container(
            decoration: BoxDecoration(
                color: color ?? AppColors.primary, shape: BoxShape.circle),
            padding: EdgeInsets.all(paddingSize ?? 10),
            child: Icon(
              iconData,
              color: iconColor?? Colors.white,
              size: iconSize ?? 18,
            ),
          ),
        ),
        if (label != null) ...[
          const SizedBox(
            height: 5,
          ),
          Text(
            label,
            style: AppTextStyle.caption,
          )
        ]
      ],
    );
  }

  static Widget square({
    VoidCallback? onPressed,
    required IconData iconData,
    double size = 45,
    double? rounded,
    double? iconSize,
    String? label,
    Color? color,
    Color? labelColor,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onPressed,
          splashColor: Colors.white.withOpacity(0.4),
          child: Container(
            width: size,
            height: size,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(rounded ?? AppSizeStyle.defaultRoundMd),
              color: color ?? AppColors.primary,
              shape: BoxShape.rectangle,
            ),
            child: Icon(
              iconData,
              color: labelColor?? Colors.white,
              size: iconSize ?? 18,
            ),
          ),
        ),
        if (label != null) ...[
          const SizedBox(
            height: 5,
          ),
          Text(
            label,
            style: AppTextStyle.caption,
          )
        ]
      ],
    );
  }

  Widget _buttonLoadingBuilder(int numberOfDots,
      {Color dotColor = Colors.black}) {
    return JumpingDotsProgressIndicator(
      numberOfDots: numberOfDots,
      dotColor: dotColor,
      dotSize: 3,
      animatedDuration: const Duration(milliseconds: 150),
    );
  }

  static Widget primaryButton({
    required String label,
    required VoidCallback onPressed,
    Widget? child,
    bool isLoading = false,
    bool isEnable = true,
    double height = 45,
    double width=double.infinity,
    EdgeInsetsGeometry margin = const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
  }) {
    return Padding(
      padding: margin,
      child: SizedBox(
        height: height,
        child: ElevatedButton(
          onPressed: isEnable && !isLoading ? onPressed : null,
          style: isEnable && !isLoading
              ? _style.kPrimaryButtonStyle(height: height, width: width)
              : _style.kDisableButtonStyle(height: height, width: width),
          child: isLoading
              ? _appButton._buttonLoadingBuilder(
                  5,
                  dotColor: AppColors.darkGrey,
                )
              : child ??
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
        ),
      ),
    );
  }

  

  static Widget secondaryButton({
    required String label,
    required VoidCallback onPressed,
    Widget? child,
    bool isLoading = false,
    bool isEnable = true,
    double height = 35,
    double width=double.infinity,
    EdgeInsetsGeometry margin = const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
  }) {
    return Padding(
      padding: margin,
      child: SizedBox(
        height: height,
        child: ElevatedButton(
          onPressed: isEnable && !isLoading ? onPressed : null,
          style: isEnable && !isLoading
              ? _style.kSecondaryButtonExpandStyle(height: height, width: width)
              : _style.kDisableButtonStyle(height: height, width: width),
          child: isLoading
              ? _appButton._buttonLoadingBuilder(
                  5,
                  dotColor: AppColors.darkGrey,
                )
              : child ??
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
        ),
      ),
    );
  }

  static Widget primaryOutlinedButton({
    required String label,
    required VoidCallback onPressed,
    bool isLoading = false,
    bool isEnable = true,
    double height = 45,
    double width=double.infinity,
    EdgeInsetsGeometry margin = const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
  }) {
    return Padding(
      padding: margin,
      child: SizedBox(
        height: height,
        child: ElevatedButton(
          onPressed: isEnable && !isLoading ? onPressed : null,
          style: isEnable && !isLoading
              ? _style.kOutlinedButtonExpandStyle(height: height, width: width)
              : _style.kOutlinedButtonExpandStyle(
                width: width,
                  height: height, borderColor: AppColors.greyishDisable),
          child: isLoading
              ? _appButton._buttonLoadingBuilder(
                  5,
                  dotColor: AppColors.darkGrey,
                )
              : Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: (isEnable && !isLoading)
                        ? AppColors.primary
                        : AppColors.greyishDisable,
                  ),
                ),
        ),
      ),
    );
  }
}
