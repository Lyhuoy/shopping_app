import 'package:flutter/material.dart';

class KComponent {
  static Padding devider = const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Divider(
        height: 0.5,
        thickness: 0.5,
        color: Colors.black12,
      ));

      static const Divider deviderWithoutSpace = Divider(
        height: 0.5,
        thickness: 0.5,
        color: Colors.black12,
      );

  static SizedBox space = const SizedBox(
    height: 18,
    width: 10,
  );

  static Padding horizentalDevider = Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: 35,
        width: .7,
        color: Colors.black12,
      ));
  static Padding kDeviderHorizontal = const Padding(
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      child: Divider(
        thickness: 0.5,
        color: Colors.black12,
      ));
}
