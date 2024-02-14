import 'package:get/get.dart';

enum HomeFunctionKey {
  none,
  inventoryCount,
  personalItemList,
  checkPrice,
  checkStock,
  transferReceived,
  ;

  factory HomeFunctionKey.fromString(String source) {
    return HomeFunctionKey.values.firstWhereOrNull(
            (element) => element.name.toLowerCase() == source.toLowerCase()) ??
        HomeFunctionKey.none;
  }
}

extension IsHomeFunctionKey on HomeFunctionKey {
  bool get isNone => this == HomeFunctionKey.none;
  bool get isInventoryCount => this == HomeFunctionKey.inventoryCount;
  bool get isPersonalItem => this == HomeFunctionKey.personalItemList;
  bool get isCheckPrice => this == HomeFunctionKey.checkPrice;
  bool get isCheckStock => this == HomeFunctionKey.checkStock;
  bool get isStockTransfer => this == HomeFunctionKey.transferReceived;
}
