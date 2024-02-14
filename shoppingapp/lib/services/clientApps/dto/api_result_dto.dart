import 'dart:convert';

class ApiResultDto {
  dynamic result;
  List<String> response =[];
  String targetUrl;
  bool success;
  String status;
  dynamic error;
  bool unAuthorizedRequest;
  bool abp;
  ApiResultDto({
    this.result,
    required this.response,
    this.targetUrl = '',
    this.success = false,
    this.error,
    this.status = '',
    this.unAuthorizedRequest = false,
    this.abp = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'result': result,
      'targetUrl': targetUrl,
      'success': success,
      'error': error,
      'unAuthorizedRequest': unAuthorizedRequest,
      'abp': abp,
    };
  }

  factory ApiResultDto.fromMap(Map<String, dynamic> map) {
    return ApiResultDto(
      result: map['Result'] ?? map['results'],
      response: [],
      targetUrl: map['TargetUrl'] ?? '',
      success: map['Success'] ?? false,
      status: map['status'] ?? '',
      error:
          map['Error'] != null ? ApiResultError.fromJson(map['Error']) : null,
      unAuthorizedRequest: map['UnAuthorizedRequest'] ?? false,
      abp: map['_abp'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());
}

class ApiResultError {
  late int code;
  late String message;
  late String details;
  late dynamic validationErrors;

  ApiResultError(
      {this.code = 0,
      this.message = '',
      this.details = '',
      this.validationErrors});

  factory ApiResultError.fromJson(Map<String, dynamic> json) {
    return ApiResultError(
        code: json['Code'] ?? 0,
        message: json['Message'] ?? '',
        details: json['Details'] ?? '',
        validationErrors: json['ValidationErrors']);
  }

  // static ApiResultError dioError(DioError error) {
  //   return ApiResultError(
  //       code: error.type == DioErrorType.response ? (error.response!.statusCode == null ? 0 : error.response!.statusCode!) : error.type.index,
  //       message: error.type == DioErrorType.response ? error.response!.statusMessage! : error.message,
  //       details: "${error.stackTrace}",
  //       validationErrors: "${error.response}");
  // }
}