

import 'package:shoppingapp/core.dart';

class ResultModel<T> {
  late T? result;
  late bool success;
  late ApiResultError? error;
  late bool unAuthorizedRequest;
  
  ResultModel({this.result, this.success=false, this.error, this.unAuthorizedRequest=false});

  ResultModel<T> create(T? result, bool success, ApiResultError? error, bool unAuthorizedRequest) {
  var resultModel = ResultModel<T>();
  resultModel.result = result;
  resultModel.success = success;
  resultModel.error = error;
  resultModel.unAuthorizedRequest = unAuthorizedRequest;
  return resultModel;
  }
}

class ResultErrorModel
{
  late int code;
  late String message;
  late String details;
  late List<ValidationErrorResultModel> validationErrors =[];

  ResultErrorModel({this.code=0,this.message='',this.details=''});
  //ApiOutputError
  factory ResultErrorModel.create(ApiOutputError dto){
    var result = ResultErrorModel();
    result.code = dto.code;
    result.message = dto.message;
    result.details = dto.details;
    return result;
  }
}

class ValidationErrorResultModel
{
  late String message;
  late List<String> members;
}