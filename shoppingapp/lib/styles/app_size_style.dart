import 'package:flutter/material.dart';

class AppSizeStyle {
  static const double spaceHight = 20.0;

  static const double defaultRoundZero = 0.0;
  static const double defaultRoundLg = 15.0;
  static const double noRoundLg = 0.0;
  static const double defaultRoundMd = 10.0;
  static const double defaultRoundSm = 5.0;

  static const double buttonRound = 10.0;

  static const double textPaddingLg = 20.0;
  static const double textPaddingMd = 10.0;
  static const double textPaddingSm = 5.0;

  static const double listPaddingLg = 20.0;
  static const double listPaddingMd = 10.0;
  static const double listPaddingSm = 5.0;

  static const double productItemBorderWidth = 0.2;

  static const double iconHeader = 22;
  static const double iconBody = 17;

  static EdgeInsets headerPadding = const EdgeInsets.only(
    left: 15,
    right: 15,
    top: 10,
  );

  static EdgeInsets productItemPadding = const EdgeInsets.only(
    left: 15,
    top: 15,
    right: 15,
    bottom: 5,
  );

  static Widget getBottomPadding(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).viewPadding.bottom > 0 ? 20 : 15,
    );
  }
}

// class KSizeStyle {
//   static const double spaceHight = 20.0;

//   static double defaultRoundZero = 0.0;
//   static double defaultRoundLg = 5.0;
//   static double defaultRoundMd = 5.0;
//   static double defaultRoundSm = 5.0;

//   static const double textPaddingLg = 20.0;
//   static const double textPaddingMd = 10.0;
//   static const double textPaddingSm = 5.0;

//   static const double listPaddingLg = 20.0;
//   static const double listPaddingMd = 10.0;
//   static const double listPaddingSm = 5.0;

//   static const double productItemBorderWidth = 0.2;

//   static EdgeInsets headerPadding =
//       const EdgeInsets.only(left: 15, right: 15, top: 10);
//   static EdgeInsets containerPadding =
//       const EdgeInsets.only(left: 7, top: 10, right: 7, bottom: 0);

//   static EdgeInsets productItemPadding =
//       const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 5);

//   static Widget getBottomPadding(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).viewPadding.bottom > 0 ? 20 : 15,
//     );
//   }
// }
