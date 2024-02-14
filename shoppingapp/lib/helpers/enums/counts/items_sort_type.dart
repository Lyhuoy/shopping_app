
// ignore_for_file: constant_identifier_names

enum ItemsSortType{
  ItemCode, ItemBarcode, ItemDescription, LastCount
}

extension IsCountSortType on ItemsSortType {
  bool get isItemCode => this == ItemsSortType.ItemCode;
  bool get isItemBarcode => this == ItemsSortType.ItemBarcode;
  bool get isItemDescription => this == ItemsSortType.ItemDescription;
  bool get isLastCount => this == ItemsSortType.LastCount;
}