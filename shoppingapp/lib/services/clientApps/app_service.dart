import 'dart:convert';
import 'dart:io';
import 'package:shoppingapp/core.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get/get.dart';

class AppService implements IAppService {
  late Dio _client;

  AppService() {
    _initClient();
  }

  _initClient() {
    BaseOptions options = BaseOptions(
        baseUrl: ApiConfigHelper.url(),
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 5), // 5 seconds
        receiveTimeout: const Duration(seconds: 60) // 60 seconds
        );

    _client = Dio(options);
    // ignore: deprecated_member_use
    (_client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  @override
  Future<ApiResultDto> deletesAsync<I>(
      {required String apiName,
      required I input,
      bool tokenRequired = true,
      String baseUrl = "",
      CancelToken? cancelToken}) async {
    var result = ApiResultDto();
    try {
      baseUrl = baseUrl.isNotEmpty ? baseUrl : ApiConfigHelper.url();
      var response = await _client.deleteUri(Uri.parse(baseUrl),
          data: jsonEncode(input),
          options: ApiConfigHeader.getOptionHeader(),
          cancelToken: cancelToken);
      result.result = ApiOutput.fromJson(response.data);
      return result;
    } on DioException catch (e) {
      result.error = ApiResultError(message: e.message!);
      return result;
    }
  }

  @override
  Future<ApiResultDto> getsAsync(
      {required String apiName,
      bool tokenRequired = true,
      String token = "",
      CancelToken? cancelToken}) async {
    var result = ApiResultDto();
    try {
      var response = await _client.getUri(
          Uri.parse(ApiConfigHelper.url(apiName: apiName)),
          options: ApiConfigHeader.getOptionHeader(token: token),
          cancelToken: cancelToken);
      result = ApiResultDto.fromMap(response.data);
      result.status = response.statusMessage ?? "";
      result.statusCode = response.statusCode;
      return result;
    } on DioException catch (e) {
      result.error = ApiResultError(message: e.message!);
      return result;
    }
  }

  @override
  Future<dynamic> getDynamicAsync(
      {required String apiName,
      bool tokenRequired = true,
      String baseUrl = "",
      CancelToken? cancelToken}) async {
    var result = ApiResultDto();
    try {
      baseUrl = baseUrl.isNotEmpty ? baseUrl : ApiConfigHelper.url();
      var response = await _client.getUri(Uri.parse(baseUrl),
          options: ApiConfigHeader.getOptionHeader(), cancelToken: cancelToken);
      result.result = response.data;
      return result;
    } on DioException catch (e) {
      result.error = ApiResultError(message: e.message!);
      return result;
    }
  }

  @override
  Future<ApiResultDto> postsAsync<I>(
      {required String apiName,
      required I input,
      bool tokenRequired = true,
      String baseUrl = "",
      CancelToken? cancelToken}) async {
    var result = ApiResultDto();
    try {
      baseUrl =
          baseUrl.isNotEmpty ? baseUrl : ApiConfigHelper.url(apiName: apiName);
      var data = jsonEncode(input);
      var response = await _client.post(
        baseUrl,
        data: data,
        options: ApiConfigHeader.getOptionHeader(),
        cancelToken: cancelToken,
      );
      result = ApiResultDto.fromMap(response.data);
      return result;
    } on DioException catch (e) {
      e.printError();
      if (_isServerDown(e)) {
        result.error = ApiResultError(
            code: ApiResponseCode.domainNotValid,
            message: "Failure",
            details: "DomainNotValid");
        return result;
      }
      result.error = ApiResultError(message: e.message ?? "");
      return result;
    } catch (e) {
      e.printError();
      result.error = ApiResultError(message: "SomethingWentWrong");
      return result;
    }
  }

  @override
  Future<ApiResultDto> putsAsync<I>(
      {required String apiName,
      required I input,
      bool tokenRequired = true,
      String baseUrl = "",
      CancelToken? cancelToken}) async {
    var result = ApiResultDto();
    try {
      baseUrl = baseUrl.isNotEmpty ? baseUrl : ApiConfigHelper.url();
      var response = await _client.putUri(Uri.parse(baseUrl),
          data: jsonEncode(input),
          options: ApiConfigHeader.getOptionHeader(),
          cancelToken: cancelToken);
      result.result = ApiOutput.fromJson(response.data);
      return result;
    } on DioException catch (e) {
      result.error = ApiResultError(message: e.message!);
      return result;
    }
  }

  bool _isServerDown(DioException error) {
    return (error.error is SocketException) ||
        (error.type == DioExceptionType.unknown);
  }
}
