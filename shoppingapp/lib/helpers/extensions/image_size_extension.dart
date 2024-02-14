import 'package:shoppingapp/core.dart';

extension PhotoUrlExtension on String {
  String toPhotoUrl(String size) {
    if (isEmpty) return '';
    return "$this-$size.jpg";
  }

  String toPhotoUrlSize400() {
    if (isEmpty) return '';
    return "$this-${AppImageResponseSize.s400}.jpg";
  }
}
