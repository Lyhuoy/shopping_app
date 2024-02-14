// ignore_for_file: constant_identifier_names


import 'package:get/utils.dart';

enum ResultStockType {
  None,
  Success,
  NotStockItem,
  NoCode;

  factory ResultStockType.fromString(String source) {
   return  ResultStockType.values.firstWhereOrNull((element) =>
            element.name.toLowerCase() == source.toLowerCase()) ??
        ResultStockType.None;
  }
}

extension IsResultStockType on ResultStockType {
  bool get isNoItem => this == ResultStockType.NotStockItem;
  bool get isSuccess => this == ResultStockType.Success;
  bool get isNoCode => this == ResultStockType.NoCode;
}
