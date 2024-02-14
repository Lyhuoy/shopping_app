
import 'package:shoppingapp/core.dart';
import 'package:get/get.dart';

class AuthLoginOutputModel {
  final _userId = 0.obs;
  int get userId => _userId.value;
  set userId(int value) => _userId.value = value;

  AuthLoginOutputModel({int userId = 0}) {
    this.userId = userId;
  }

  static AuthLoginOutputModel create(AuthApiOutputDto dto){
    var result = AuthLoginOutputModel();
    result.userId = dto.userId;
    return result;
  }
}
