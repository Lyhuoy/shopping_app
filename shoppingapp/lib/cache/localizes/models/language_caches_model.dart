import 'package:shoppingapp/core.dart';
import 'package:hive/hive.dart';
part 'language_caches_model.g.dart';

@HiveType(typeId: CacheKey.localize)
class LanguageCacheModel {
  @HiveField(0, defaultValue: 0)
  int type = 0;

  LanguageCacheModel({this.type = 0});

  LanguageCacheModel.create(int type) {
    type = type;
  }
}
