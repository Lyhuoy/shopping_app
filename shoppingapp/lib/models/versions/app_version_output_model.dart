import 'package:get/get.dart';

class AppVersionInputModel {
  final _versionName = ''.obs;
  String get versionName => _versionName.value;
  set versionName(String value) => _versionName.value = value;
  
  AppVersionInputModel();
}
