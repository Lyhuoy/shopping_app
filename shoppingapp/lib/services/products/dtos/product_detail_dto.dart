import 'dart:convert';

class ProductDetailDto {
  int id;
  String name;
  String sku;
  String quantity;
  String price;
  String detail;
  String image;
  List<String> size;
  String description;
  int brandId;
  int subCategoryId;

  ProductDetailDto({
    this.id = 0,
    this.name = "",
    this.sku = "",
    this.quantity = "",
    this.price = "",
    this.detail = "",
    this.image = '',
    this.size = const [],
    this.description = '',
    this.brandId = 0,
    this.subCategoryId = 0,
  });

  factory ProductDetailDto.fromRawJson(String str) =>
      ProductDetailDto.fromJson(json.decode(str));

  factory ProductDetailDto.fromJson(Map<String, dynamic> json) {
    var dtoSize = json["size"] as List?;
    var listSize = <String>[];
    if (dtoSize != null) {
      listSize = dtoSize.map((e) => '$e').toList();
    }
    return ProductDetailDto(
      id: json["id"],
      name: json["name"],
      sku: json["sku"],
      quantity: json["quantity"],
      price: json["price"],
      detail: json["detail"],
      image: json["image"],
      size: listSize,
      description: json["description"],
      brandId: json["brand_id"],
      subCategoryId: json["sub_category_id"],
    );
  }
}
