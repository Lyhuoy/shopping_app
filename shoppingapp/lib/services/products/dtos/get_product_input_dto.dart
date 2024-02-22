import 'package:shoppingapp/core.dart';

class GetProductInputDto {
  static Map<String, dynamic> toJson(GetProductInputModel input) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brand_id'] = input.brandId;
    data['search'] = input.search;
    data['page'] = input.page;
    data['perPage'] = input.count;
    return data;
  }

  static String toParamString(GetProductInputModel input) => "?brand_id='${input.brandId}'&search='${input.search}'&page='${input.page}'&perPage='${input.count}'";
}
