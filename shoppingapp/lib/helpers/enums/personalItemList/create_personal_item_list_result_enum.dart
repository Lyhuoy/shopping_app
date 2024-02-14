
enum CreatePersonalItemListResultEnum {
  none,
  success;

  factory CreatePersonalItemListResultEnum.fromString(String source) {
   return  CreatePersonalItemListResultEnum.values.firstWhere((element) =>
            element.name.toLowerCase() == source.toLowerCase(), orElse: () => CreatePersonalItemListResultEnum.none,);
  }
}

extension IsCreatePersonalItemListResultEnum on CreatePersonalItemListResultEnum {
  bool get isSuccess => this == CreatePersonalItemListResultEnum.success;
}