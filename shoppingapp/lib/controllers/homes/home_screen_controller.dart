// ignore_for_file: invalid_use_of_protected_member

import 'package:shoppingapp/core.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreenController extends AppBaseController {
  final RefreshController homeRefreshController = RefreshController();
  final IProductService _productService = ProductService();

  // final IConfigurationService _configurationService = ConfigurationService();

//#region All Override method
  @override
  void onReady() async {
    brandList = BrandModel().sampleData(10);
    await currentLanguagesAsync();
    await getProductAsync();
    super.onReady();
  }

//#endregion

//#region All Properties

  final _userName = 'Thy Lava'.obs;
  String get userName => _userName.value;
  set userName(String value) => _userName.value = value;

  final _brandList = <BrandModel>[].obs;
  List<BrandModel> get brandList => _brandList.value;
  set brandList(List<BrandModel> value) => _brandList.value = value;

  final _homeProduct = <ProductDetailModel>[].obs;
  List<ProductDetailModel> get homeProduct => _homeProduct.value;
  set homeProduct(List<ProductDetailModel> value) => _homeProduct.value = value;

//#endregion

//* #region All Method Helpers

  Future<void> getProductAsync() async {
    showLoadingFullScreen();
    var result = await _productService.getProductsAsync(GetProductInputModel());
    hideLoadingFullScreen();
    if (result.success && result.result != null) {
      homeProduct.addAll(result.result ?? []);
    }
  }

//#endregion

//#region All Command
  void onHomeRefresh() async {}

  void logout() async {
    AppChoiceDialog.okCancel(
      title: "Logout".tr,
      message: "LogoutOfYourAccount".tr,
      okTitle: "Logout".tr,
      onOk: () async {
        showLoadingFullScreen();
        await Future.delayed(const Duration(seconds: 2));
        hideLoadingFullScreen();
        navigationToOffAllNamedAsync(AppRoutes.login);
      },
    );
  }
//#endregion
}
