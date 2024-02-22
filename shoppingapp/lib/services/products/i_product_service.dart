
import 'package:shoppingapp/core.dart';

abstract class IProductService{
  Future<ResultModel<List<ProductDetailModel>>> getProductsAsync(GetProductInputModel input);
}