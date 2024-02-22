

import 'package:shoppingapp/cache/users/models/user_caches_model.dart';
import 'package:shoppingapp/core.dart';

import 'i_user_service.dart';

class UserService implements IUserService {
  final _cacheService = AppCacheService();

  @override
  Future<UserCacheModel> getUserAsync() async{
    try {
      var resultDb = await _cacheService.getsAsync<UserCacheModel>(key: AppCacheKey.localize);
      if (resultDb !=null) {
        var result = resultDb;
        return result;
      } else {
       await _cacheService.putAsync<UserCacheModel>(key: AppCacheKey.localize, value: UserCacheModel());
        return UserCacheModel();
      }
    } catch (e) {
      return UserCacheModel();
    }
  }

  @override
  Future<void> updateUserAsync(UserCacheModel user) async{
    try {
      // update language
      await _cacheService.updatesAtAsync<UserCacheModel>(key: AppCacheKey.localize, value: user);
    } catch (e) {
      // exception error
    }
  }

}