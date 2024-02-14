import 'localize_en.dart';
import 'localize_kh.dart';

abstract class LocalizeApp {
  static Map<String, Map<String, String>> languagesCode = {
    "en_US": english,
    "km_KH": khmer
  };
}
