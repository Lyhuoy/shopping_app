// ignore_for_file: constant_identifier_names

enum ResultTransferStockType {
  None,
  Success,
  NoItem,
  NoCode;

  static ResultTransferStockType fromString(String value) {
    return ResultTransferStockType.values
        .firstWhere((e) => e.name.toLowerCase() == value.toLowerCase(), orElse: () => ResultTransferStockType.None,);
  }
}

extension IsResultTransferStockType on ResultTransferStockType {
  bool get isNoItem => this == ResultTransferStockType.NoItem;
  bool get isSuccess => this == ResultTransferStockType.Success;
  bool get isNoCode => this == ResultTransferStockType.NoCode;
}
