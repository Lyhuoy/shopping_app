

import 'package:shoppingapp/cache/users/models/user_caches_model.dart';

abstract class IUserService {
  Future<UserCacheModel> getUserAsync();
  Future<void> updateUserAsync(UserCacheModel user);
}