// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:shoppingapp/core.dart';

class ProductDetailModel {
  int id = 0;
  int brandId = 0;
  int categoryId = 0;

  final _name = ''.obs;
  String get name => _name.value;
  set name(String value) => _name.value = value;

  final _sku = ''.obs;
  String get sku => _sku.value;
  set sku(String value) => _sku.value = value;

  final _qty = 0.0.obs;
  double get qty => _qty.value;
  set qty(double value) => _qty.value = value;

  final _price = 0.0.obs;
  double get price => _price.value;
  set price(double value) => _price.value = value;

  final _photoUrl = ''.obs;
  String get photoUrl => _photoUrl.value;
  set photoUrl(String value) => _photoUrl.value = value;

  final _sizeList = <String>[].obs;
  List<String> get sizeList => _sizeList.value;
  set sizeList(List<String> value) => _sizeList.value = value;

  final _description = ''.obs;
  String get description => _description.value;
  set description(String value) => _description.value = value;

  ProductDetailModel();

  factory ProductDetailModel.create(ProductDetailDto dto) {
    var result = ProductDetailModel();
    result.id = dto.id;
    result.brandId = dto.brandId;
    result.categoryId = dto.subCategoryId;
    result.name = dto.name;
    result.sku = dto.sku;
    result.qty =double.tryParse(dto.quantity)??0;
    result.price =double.tryParse(dto.price)??0;
    result.photoUrl = dto.image;
    result.description = dto.description;
    return result;
  }
}
