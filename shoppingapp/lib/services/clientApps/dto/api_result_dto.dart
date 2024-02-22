import 'dart:convert';

class ApiResultDto {
 
  dynamic result;
  String targetUrl;
  bool success;
  String status;
  int? statusCode;
  String message;
  dynamic error;
  bool unAuthorizedRequest;
  bool abp;
  ApiResultDto({
    this.result,
    this.targetUrl = '',
    this.success = false,
    this.message = '',
    this.error,
    this.status = '',
    this.statusCode,
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
      result: map['data'],
      targetUrl: map['TargetUrl'] ?? '',
      success: map['status'] ?? false,
      status: '${map['status']}',
      message: map['message'] ??'',
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