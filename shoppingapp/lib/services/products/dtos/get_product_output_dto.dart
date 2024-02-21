import 'product_detail_dto.dart';

class GetProductOutputDto {
  List<ProductDetailDto> data;
  GetProductOutputDto({this.data = const []});
  factory GetProductOutputDto.fromJson(Map<String, dynamic> json) =>
      GetProductOutputDto(
        data: List<ProductDetailDto>.from(
            json["data"].map((x) => ProductDetailDto.fromJson(x))),
      );
}
