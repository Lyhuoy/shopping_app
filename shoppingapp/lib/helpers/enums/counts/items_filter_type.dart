// ignore_for_file: constant_identifier_names

enum ItemsFilterType { All, Counted, Uncounted, Matched, Unmatched }

extension IsCountFilterType on ItemsFilterType {
  bool get isAll => this == ItemsFilterType.All;
  bool get isCounted => this == ItemsFilterType.Counted;
  bool get isUncounted => this == ItemsFilterType.Uncounted;
  bool get isMatched => this == ItemsFilterType.Matched;
  bool get isUnmatched => this == ItemsFilterType.Unmatched;
}
