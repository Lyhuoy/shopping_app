import 'package:shoppingapp/core.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String toFormatDateString(String pattern) {
    try {
      return DateFormat(pattern).format(this);
    } catch (e) {
      return "";
    }
  }

  String timeAgoSinceDate(DateTime dt, {bool numericDates = true}) {
    DateTime date = dt.isUtc ? dt.toLocal() : dt;
    final date2 = DateTime.now().toLocal();
    final difference = date2.difference(date);
    //if (difference.inSeconds < 5) return 'Just now';
    // if (difference.inSeconds < 60) return '${difference.inSeconds} seconds ago';
    // if (difference.inMinutes <= 1) {
    //   return (numericDates) ? '1 minute ago' : 'A minute ago';
    // }
    // if (difference.inMinutes < 60) return '${difference.inMinutes} minutes ago';
    // if (difference.inHours <= 1) {
    //   return (numericDates) ? '1 hour ago' : 'An hour ago';
    // }
    // if (difference.inHours < 24) return '${difference.inHours} hours ago';
    if (difference.inDays == 0) {
      return "Today".tr;
    }
    if (difference.inDays == 1) {
      return (numericDates) ? "OneDayAgo".tr : "Yesterday".tr;
    }
    if (difference.inDays < 6) {
      return (numericDates)
          ? '${difference.inDays} ${"DaysAgo".tr}'
          : "ThisWeek".tr;
    }
    if ((difference.inDays / 7).ceil() <= 1) {
      return (numericDates) ? "OneWeekAgo".tr : "LastWeek".tr;
    }
    if ((difference.inDays / 7).ceil() < 4) {
      return '${(difference.inDays / 7).ceil()} ${"WeeksAgo".tr}';
    }
    if ((difference.inDays / 30).ceil() <= 1) {
      return (numericDates) ? "OneMonthAgo".tr : "LastMonth".tr;
    }
    if ((difference.inDays / 30).ceil() < 30) {
      return '${(difference.inDays / 30).ceil()} ${"MonthsAgo".tr}';
    }
    if ((difference.inDays / 365).ceil() <= 1) {
      return (numericDates) ? "OneYearAgo".tr : "LastYear".tr;
    }
    return '${(difference.inDays / 365).floor()} ${"YearsAgo".tr}';
  }
}

extension IntToDateExtension on int {
  String toDateCountFormart() {
    String result = '--D --:--:--';
    String day = '00';
    String hour = '00';
    String mn = '00';
    String sc = '00';
    var second = this;
    int coefficient = 0;
    // find day
    if (second > 86400) {
      coefficient = second ~/ 86400;
      day = "$coefficient";
      second -= coefficient * 86400;
    }
    //find hours
    if (second > 3600) {
      coefficient = second ~/ 3600;
      hour = "$coefficient";
      second -= coefficient * 3600;
    }
    //find minut
    if (second > 60) {
      coefficient = second ~/ 60;
      mn = coefficient.fromGenricToString('##');
      second -= coefficient * 60;
    }

    // second
    sc = second.fromGenricToString('##');
    result = "${day}D $hour:$mn:$sc";
    return result;
  }

  /// This function will return list of string
  /// [day, hour, min, secons]
  ///
  List<String> toDateCountFormartSeperated() {
    List<String> result = [];
    String day = '00';
    String hour = '00';
    String mn = '00';
    String sc = '00';
    var second = this;
    int coefficient = 0;
    // find day
    if (second > 86400) {
      coefficient = second ~/ 86400;
      day = coefficient.fromGenricToString('00');
      second -= coefficient * 86400;
    }
    //find hours
    if (second > 3600) {
      coefficient = second ~/ 3600;
      hour = coefficient.fromGenricToString('00');
      second -= coefficient * 3600;
    }
    //find minut
    if (second > 60) {
      coefficient = second ~/ 60;
      mn = coefficient.fromGenricToString('00');
      second -= coefficient * 60;
    }

    // second
    sc = second.fromGenricToString('00');
    result.addAll([day, hour, mn, sc]);
    return result;
  }
}
