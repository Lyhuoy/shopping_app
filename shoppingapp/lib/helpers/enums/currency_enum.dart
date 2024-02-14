enum AppCurrencyEnum {
  usd;

  String get toSymbol {
    switch (this) {
      case AppCurrencyEnum.usd:
        return "\$";
      default:
        return "\$";
    }
  }
}

extension AppCurrencySymbol on AppCurrencyEnum {
  String get toSymbol {
    switch (this) {
      case AppCurrencyEnum.usd:
        return "\$";
      default:
        return "\$";
    }
  }
}
