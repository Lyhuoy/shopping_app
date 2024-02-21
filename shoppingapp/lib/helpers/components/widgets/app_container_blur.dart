import 'dart:ui';
import 'package:flutter/material.dart';

class AppContainerBlur extends StatelessWidget {
  const AppContainerBlur({
    Key? key,
    required this.child,
    this.decoration,
    this.padding,
    this.constraints,
    this.blurRadius = 60,
  }) : super(key: key);
  final Widget child;
  final BoxDecoration? decoration;
  final EdgeInsets? padding;
  final BoxConstraints? constraints;
  final double blurRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration ?? const BoxDecoration(),
      padding: padding,
      constraints: constraints,
      clipBehavior: Clip.antiAlias,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blurRadius,
          sigmaY: blurRadius,
          tileMode: TileMode.mirror,
        ),
        child: child,
      ),
    );
  }
}
