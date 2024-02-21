import 'package:get/get.dart';

class GetProductInputModel {
  int brandId = 0;

  final _search = ''.obs;
  String get search => _search.value;
  set search(String value) => _search.value = value;

  final _page = 1.obs;
  int get page => _page.value;
  set page(int value) => _page.value = value;

  final _count = 30.obs;
  int get count => _count.value;
  set count(int value) => _count.value = value;
}
