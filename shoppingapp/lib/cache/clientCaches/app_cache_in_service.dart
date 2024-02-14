abstract class IAppCacheService {
  Future<void> putAsync<T>({required String key,required T value});
  Future<void> putAtAsync<T>({required String key,required T value,int index=0});
  Future<T?> getsAsync<T>({required String key, T? value});
  Future<T?> getAtAsync<T>({required String key, T? value,int index=0});
  Future<void> updatesAtAsync<T>({required String key,required T value,int index=0});
  Future<void> updatesAllAsync<T>({required String key,required T value,int index=0});
  Future<void> deletesAsync<T>({required String key,T? value});
  Future<void> deleteAtAsync<T>({required String key,T? value,int index=0});
  Future<void> deletesFromDiskAsync<T>({required String key,T? value});
}