import 'package:get/get.dart';

class AuthLoginInputModel {
  final _userName = ''.obs;
  String get userName => _userName.value;
  set userName(String value) => _userName.value = value;

   final _domainName = ''.obs;
  String get domainName => _domainName.value;
  set domainName(String value) => _domainName.value = value;

  final _password = ''.obs;
  String get password => _password.value;
  set password(String value) => _password.value = value;
  
  final _rememberMe = false.obs;
  bool get rememberMe => _rememberMe.value;
  set rememberMe(bool value) => _rememberMe.value = value;

  AuthLoginInputModel({String userName = '', String password = '',bool rememberMe=false}) {
    this.userName = userName;
    this.password = password;
    this.rememberMe = rememberMe;
  }
}
