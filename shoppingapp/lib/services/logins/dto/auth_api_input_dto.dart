

import 'package:shoppingapp/core.dart';

class AuthApiInputDto {
  
  String userName;
  String password;
  bool rememberMe;

  AuthApiInputDto({this.userName='', this.password='',this.rememberMe=false});

  static Map<String, dynamic> toJson(AuthLoginInputModel input) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = input.userName;
    data['password'] = input.password;
    data['rememberMe'] = input.rememberMe;
    return data;
  }
  
}