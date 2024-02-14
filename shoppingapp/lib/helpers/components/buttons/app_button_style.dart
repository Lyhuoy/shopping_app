import 'package:shoppingapp/core.dart';
import 'package:flutter/material.dart';

class AppButtonStyle {
  ButtonStyle btnBottomStyle = ButtonStyle(
    shadowColor: const MaterialStatePropertyAll(Colors.transparent),
    foregroundColor: const MaterialStatePropertyAll(Colors.white),
    backgroundColor: const MaterialStatePropertyAll(AppColors.primary),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizeStyle.buttonRound),
        side: const BorderSide(color: AppColors.primary),
      ),
    ),
  );

  ButtonStyle kPrimaryButtonStyle({
    double height = 45,
    double width = double.infinity,
  }) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColors.primary),
      minimumSize: MaterialStateProperty.all(Size(width, height)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(AppSizeStyle.buttonRound),
        ),
      ),
      textStyle: MaterialStateProperty.all(
        const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      overlayColor: MaterialStateProperty.all(
        Colors.white.withOpacity(0.2),
      ),
      elevation: MaterialStateProperty.all(0),
    );
  }

  ButtonStyle kDisableButtonStyle({
    double height = 45,
    double width = double.infinity,
  }) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(const Color(0xFFE6E6E6)),
      minimumSize: MaterialStateProperty.all(Size(width, height)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(AppSizeStyle.buttonRound),
        ),
      ),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
      elevation: MaterialStateProperty.all(0),
    );
  }

  ButtonStyle kSecondaryButtonExpandStyle({
    double height = 45,
    double width = double.infinity,
  }) {
    return ButtonStyle(
      minimumSize: MaterialStateProperty.all(Size(width, height)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(AppSizeStyle.buttonRound),
        ),
      ),
      backgroundColor: MaterialStateProperty.all(AppColors.primary.withOpacity(.05)),
      overlayColor: MaterialStateProperty.all(
        AppColors.primary.withOpacity(0.1),
      ),
      elevation: MaterialStateProperty.all(0),
    );
  }

  ButtonStyle kOutlinedButtonExpandStyle({
    double height = 45,
    double width = double.infinity,
    Color borderColor = AppColors.primary,
  }) {
    return ButtonStyle(
      minimumSize: MaterialStateProperty.all(Size(width, height)),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(AppSizeStyle.buttonRound),
        ),
      ),
      textStyle: const MaterialStatePropertyAll(
        TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimary,
        ),
      ),
      backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
      overlayColor: MaterialStateProperty.all(
        AppColors.primary.withOpacity(0.1),
      ),
      elevation: const MaterialStatePropertyAll(0),
    );
  }

  ButtonStyle kSecondaryOutlinedButtonExpandStyle({
    double height = 45,
    double width = double.infinity,
  }) {
    return ButtonStyle(
      minimumSize: MaterialStatePropertyAll(Size(width, height)),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFE6E6E6)),
          borderRadius: BorderRadius.circular(AppSizeStyle.buttonRound),
        ),
      ),
      textStyle: const MaterialStatePropertyAll(
        TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimary,
        ),
      ),
      backgroundColor: const MaterialStatePropertyAll(Colors.white),
      overlayColor: MaterialStatePropertyAll(
        AppColors.primary.withOpacity(0.1),
      ),
      elevation: MaterialStateProperty.all(0),
    );
  }

  ButtonStyle kSecondaryButtonStyle(
      {BorderRadius borderRadius = BorderRadius.zero,
      Color? backgroundColor,
      Color? textColor}) {
    return ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        backgroundColor:
            MaterialStatePropertyAll(backgroundColor ?? Colors.white),
        textStyle: MaterialStateProperty.all(
          TextStyle(color: textColor ?? AppColors.primary),
        ),
        overlayColor:
            MaterialStatePropertyAll(AppColors.primary.withOpacity(0.1)),
        elevation: const MaterialStatePropertyAll(0));
  }

  kPrimaryElevateButtonTheme() {
    return ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(AppColors.primary),
            overlayColor:
                MaterialStatePropertyAll(AppColors.primary.withOpacity(0.2)),
            elevation: const MaterialStatePropertyAll(0)));
  }
}
