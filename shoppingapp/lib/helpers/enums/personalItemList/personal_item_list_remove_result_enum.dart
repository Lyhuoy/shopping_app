enum PersonalItemListRemoveResultEnum {
  none,
  success,
  noItem;

  factory PersonalItemListRemoveResultEnum.fromString(String source) {
   return  PersonalItemListRemoveResultEnum.values.firstWhere((element) =>
            element.name.toLowerCase() == source.toLowerCase(), orElse: () => PersonalItemListRemoveResultEnum.none,);
  }
}

extension IsPersonalItemListRemoveResultEnum on PersonalItemListRemoveResultEnum {
  bool get isSuccess => this == PersonalItemListRemoveResultEnum.success;
  bool get isNoItem => this == PersonalItemListRemoveResultEnum.noItem;
}