import 'package:intl/intl.dart';

extension AppDoubleFormater on double {
  String fromGenricToString(String pattern) {
    try {
      // return DateFormat(pattern).format(this);

      //    var pBack = pattern
      //     .substring(pattern.indexOf("."));
      // var vBack = int.tryParse(toString()
      //     .split('.')[1]
      //     .substring(-0, pBack.length - 1));
      NumberFormat numberFormat = NumberFormat(pattern, "en_US");
      return numberFormat.format(this);
    } catch (e) {
      return "";
    }
  }
}

extension AppStringFormater on String {
  String toThousandSeparatorString({bool d2 = false, bool d1 = false}) {
    try {
      String formatDigti = d2 ? "#,##0.00" : d1? "#,##0.0#": "#,##0.##";
      NumberFormat numberFormat = NumberFormat(formatDigti, "en_US");
      return numberFormat.format(double.parse(this));
    } catch (e) {
      return "E";
    }
  }
}

extension AppIntergerFormater on int {
  String fromGenricToString(String pattern) {
    try {
      // return DateFormat(pattern).format(this);
      NumberFormat numberFormat = NumberFormat(pattern, "en_US");
      return numberFormat.format(this);
    } catch (e) {
      return "";
    }
  }

  String fromGenricToStrings(String pattern) {
    try {
      // return DateFormat(pattern).format(this);
      NumberFormat numberFormat = NumberFormat(pattern, "en_US");
      return numberFormat.format(this);
    } catch (e) {
      return "";
    }
  }
}
