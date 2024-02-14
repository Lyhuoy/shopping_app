

import 'package:shoppingapp/core.dart';

class LocalizeService implements ILocalizeService {
  final _cacheService = AppCacheService();

  @override
  Future<LanguageCacheModel> getLanguageAsync() async{
    try {
      var resultDb = await _cacheService.getsAsync<LanguageCacheModel>(key: AppCacheKey.localize);
      if (resultDb !=null) {
        var result = resultDb;
        return result;
      } else {
       await _cacheService.putAsync<LanguageCacheModel>(key: AppCacheKey.localize, value: LanguageCacheModel());
        return LanguageCacheModel();
      }
    } catch (e) {
      return LanguageCacheModel();
    }
  }

  @override
  Future<void> updateLocalizeAsync(int lan) async{
    try {
      // update language
      await _cacheService.updatesAtAsync<LanguageCacheModel>(key: AppCacheKey.localize, value: LanguageCacheModel(type: lan));
    } catch (e) {
      // exception error
    }
  }
}