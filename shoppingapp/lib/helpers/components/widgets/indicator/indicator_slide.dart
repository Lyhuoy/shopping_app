import 'package:shoppingapp/core.dart';
import 'package:flutter/material.dart';

class IndicatorSlide extends StatelessWidget {
  final bool isActive;
  const IndicatorSlide(this.isActive, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
          color: isActive ? AppColors.primary : Colors.white,
          borderRadius: const BorderRadius.all(
              Radius.circular(AppSizeStyle.defaultRoundMd))),
    );
    
  }
}
