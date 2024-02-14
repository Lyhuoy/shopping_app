// ignore_for_file: constant_identifier_names

enum ResultCountType {
  None,
  Success,
  NoItem,
  NoCode;

  static ResultCountType fromString(String value) {
    return ResultCountType.values
        .firstWhere((e) => e.name.toLowerCase() == value.toLowerCase(), orElse: () => ResultCountType.None,);
  }
}

extension IsResultCountType on ResultCountType {
  bool get isNoItem => this == ResultCountType.NoItem;
  bool get isSuccess => this == ResultCountType.Success;
  bool get isNoCode => this == ResultCountType.NoCode;
}
