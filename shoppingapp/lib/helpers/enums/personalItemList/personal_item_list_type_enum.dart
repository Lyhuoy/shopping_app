import 'package:get/get_utils/src/extensions/export.dart';

enum PersonalItemListTypeEnum {
  none,
  basicFilterList,
  transactionList;

  factory PersonalItemListTypeEnum.fromString(String source) {
   return  PersonalItemListTypeEnum.values.firstWhereOrNull((element) =>
            element.name.toLowerCase() == source.toLowerCase()) ??
        PersonalItemListTypeEnum.none;
  }
}

extension IsPersonalItemListType on PersonalItemListTypeEnum {
  bool get isBasicFilterList => this == PersonalItemListTypeEnum.basicFilterList;
  bool get isTransactionList => this == PersonalItemListTypeEnum.transactionList;
}