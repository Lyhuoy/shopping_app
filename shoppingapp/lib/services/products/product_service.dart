import 'package:get/get.dart';
import 'package:shoppingapp/core.dart';

class ProductService extends AppService implements IProductService {
  @override
  Future<ResultModel<List<ProductDetailModel>>> getProductsAsync(
    GetProductInputModel input,
  ) async {
    try {
      var response = await getsAsync(
          apiName: ApiName.getProduct + GetProductInputDto.toParamString(input),
          token: "10|UBuzb3YulOyCww9pd50OIhe6HtZvgikZ3wGzXrsUab8b328d");
      if (response.success && response.result != null) {
        var responseDto = response.result as List;
        var resultDto =responseDto.map((e) => ProductDetailDto.fromJson(e)).toList();

        return ResultModel(
            result:
                resultDto.map((e) => ProductDetailModel.create(e)).toList(),
            success: true);
      } else if (response.error != null) {
        return ResultModel(error: response.error);
      }
      return ResultModel(
          result: null,
          error: ApiResultError(
              code: response.statusCode ?? 0,
              message: response.message,
              details: response.status),
          success: false,
          unAuthorizedRequest: true);
    } on Exception catch (e) {
      e.printError();
      return ResultModel(
        error: ApiResultError(
          message: "Failure",
          details: "SomethingWentWrong",
        ),
      );
    }
  }
}
