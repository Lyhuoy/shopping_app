import 'package:get/get.dart';

enum GetItemPriceResultEnum {
  none,
  success,
  noCode,
  notStockItem;

  factory GetItemPriceResultEnum.fromString(String source) {
   return  GetItemPriceResultEnum.values.firstWhereOrNull((element) =>
            element.name.toLowerCase() == source.toLowerCase()) ??
        GetItemPriceResultEnum.none;
  }
}

extension IsGetItemPriceResultEnum on GetItemPriceResultEnum {
  bool get isNoItem => this == GetItemPriceResultEnum.notStockItem;
  bool get isSuccess => this == GetItemPriceResultEnum.success;
  bool get isNoCode => this == GetItemPriceResultEnum.noCode;
}