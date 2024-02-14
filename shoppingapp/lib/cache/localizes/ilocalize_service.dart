

import 'package:shoppingapp/core.dart';

abstract class ILocalizeService {
  Future<LanguageCacheModel> getLanguageAsync();
  Future<void> updateLocalizeAsync(int lan);
}