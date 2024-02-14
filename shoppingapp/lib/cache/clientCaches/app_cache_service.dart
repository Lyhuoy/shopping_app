import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shoppingapp/core.dart';

class AppCacheService implements IAppCacheService {
  @override
  Future<void> deleteAtAsync<T>(
      {required String key, T? value, int index = 0}) async {
    try {
      final box = await Hive.openBox<T>(key);
      box.deleteAt(index);
    } catch (e) {
      // exception error
    }
  }

  @override
  Future<void> deletesAsync<T>({required String key, T? value}) async {
    try {
      final box = await Hive.openBox<T>(key);
      box.delete(key);
    } catch (e) {
      // exception error
      e.printError();
    }
  }

  @override
  Future<T?> getAtAsync<T>(
      {required String key, T? value, int index = 0}) async {
    try {
      final box = await Hive.openBox<T>(key);
      var result = box.getAt(index);
      return result;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<T?> getsAsync<T>({required String key, T? value}) async {
    try {
      var box = await Hive.openBox<T>(key);
      var result = box.get(key);
      return result;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> putAsync<T>({required String key, required T value}) async {
    final box = await Hive.openBox<T>(key);
    box.put(key, value);
  }

  @override
  Future<void> putAtAsync<T>(
      {required String key, required T value, int index = 0}) async {
    try {
      final box = await Hive.openBox<T>(key);
      box.putAt(index, value);
    } catch (e) {
      // exception error
    }
  }

  @override
  Future<void> updatesAllAsync<T>(
      {required String key, required T value, int index = 0}) async {
    try {} catch (e) {
      // exception error
    }
  }

  @override
  Future<void> updatesAtAsync<T>(
      {required String key, required T value, int index = 0}) async {
    try {
      final box = await Hive.openBox<T>(key);
      box.putAt(index, value);
    } catch (e) {
      // exception error
    }
  }

  @override
  Future<void> deletesFromDiskAsync<T>(
      {required String key, T? value, int index = 0}) async {
    await Hive.deleteBoxFromDisk(key);
  }
}
