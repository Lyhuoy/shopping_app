import 'dart:convert';

class ApiOutput {
  dynamic result;
  String targetUrl;
  bool success;
  String status;
  String message;
  dynamic error;
  bool unAuthorizedRequest;
  bool abp;
  ApiOutput({
    this.result,
    this.targetUrl = '',
    this.success = false,
    this.message = '',
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

  factory ApiOutput.fromMap(Map<String, dynamic> map) {
    return ApiOutput(
      result: map['data'],
      targetUrl: map['TargetUrl'] ?? '',
      success: map['status'] ?? false,
      status: '${map['status']}',
      message: map['message'] ??'',
      error:
          map['Error'] != null ? ApiOutputError.fromJson(map['Error']) : null,
      unAuthorizedRequest: map['UnAuthorizedRequest'] ?? false,
      abp: map['_abp'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiOutput.fromJson(String source) =>
      ApiOutput.fromMap(json.decode(source));
}

class ApiOutputError {
  late int code;
  late String message;
  late String details;
  late dynamic validationErrors;

  ApiOutputError(
      {this.code = 0,
      this.message = '',
      this.details = '',
      this.validationErrors});

  ApiOutputError.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    message = json['Message'];
    details = json['Details'];
    validationErrors = json['ValidationErrors'];
  }
}
