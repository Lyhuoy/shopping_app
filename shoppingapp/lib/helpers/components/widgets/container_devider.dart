import 'package:flutter/material.dart';

class ContainerDevider {
  static SizedBox get blankSpaceS => const SizedBox(height: 5, width: 5);
  static SizedBox get blankSpaceM => const SizedBox(height: 10, width: 10);
  static SizedBox get blankSpaceL => const SizedBox(height: 15, width: 15);
  static SizedBox get blankSpaceX => const SizedBox(height: 25, width: 25);

  static Expanded blankSpaceExpanded({int flex = 1}) {
    return Expanded(flex: flex, child: const SizedBox());
  }

  static Widget vertical({
    Color color = const Color.fromRGBO(158, 158, 158, .1),
    double height = 1,
    EdgeInsets padding = const EdgeInsets.all(15),
  }) {
    return Container(
      margin: padding,
      color: color,
      height: height,
    );
  }

  static Widget horizontal({
    Color color = const Color.fromRGBO(158, 158, 158, .1),
    double width = 1,
    EdgeInsets padding = const EdgeInsets.all(15),
  }) {
    return Container(
      margin: padding,
      color: color,
      width: width,
    );
  }
}
