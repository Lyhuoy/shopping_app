import 'package:shoppingapp/core.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreenController extends AppBaseController {
  final RefreshController homeRefreshController = RefreshController();

  // final IConfigurationService _configurationService = ConfigurationService();

//#region All Override method
  @override
  void onReady() async {
    // if (await checkRequireUpdateAsync()) return;

    await currentLanguagesAsync();
    super.onReady();
  }

//#endregion

//#region All Properties
//#endregion

//* #region All Method Helpers

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
