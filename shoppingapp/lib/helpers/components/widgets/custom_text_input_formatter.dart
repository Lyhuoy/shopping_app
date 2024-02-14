import 'package:flutter/services.dart';

class CustomLengthLimitingTextInputFormatter extends TextInputFormatter {
  CustomLengthLimitingTextInputFormatter(this.maxLength)
      : assert(maxLength == -1 || maxLength > 0);

  final int maxLength;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (maxLength > 0 && getLength(newValue.text) > maxLength) {
      if (getLength(oldValue.text) == maxLength) {
        return oldValue;
      }
    }
    return newValue;
  }

  static int getLength(String value) {
    return value.runes.length;
  }
}
