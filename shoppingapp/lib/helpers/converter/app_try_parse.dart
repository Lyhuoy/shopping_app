class AppTryParse {
  int typeInt(dynamic value) {
    return int.tryParse(value??'') ?? 0;
  }
}
