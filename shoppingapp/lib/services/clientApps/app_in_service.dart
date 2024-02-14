import 'package:shoppingapp/core.dart';
import 'package:dio/dio.dart';

abstract class IAppService {
  Future<ApiResultDto> postsAsync<I>(
      {required String apiName,
      required I input,
      bool tokenRequired = true,
      String baseUrl = "",
      CancelToken? cancelToken});
  Future<ApiResultDto> putsAsync<I>(
      {required String apiName,
      required I input,
      bool tokenRequired = true,
      String baseUrl = "",
      CancelToken? cancelToken});
  Future<ApiResultDto> getsAsync(
      {required String apiName,
      bool tokenRequired = true,
      String baseUrl = "",
      CancelToken? cancelToken});

      Future<dynamic> getDynamicAsync(
      {required String apiName,
      bool tokenRequired = true,
      String baseUrl = "",
      CancelToken? cancelToken});

  Future<ApiResultDto> deletesAsync<I>(
      {required String apiName,
      required I input,
      bool tokenRequired = true,
      String baseUrl = "",
      CancelToken? cancelToken});
}