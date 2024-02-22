import 'package:shoppingapp/core.dart';
import 'package:hive/hive.dart';
part 'user_caches_model.g.dart';

@HiveType(typeId: CacheKey.userCache)
class UserCacheModel {
  @HiveField(0, defaultValue: "")
  String token = "";

  UserCacheModel({this.token = "0"});
}
