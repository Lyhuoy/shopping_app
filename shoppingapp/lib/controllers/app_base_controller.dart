import 'package:shoppingapp/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AppBaseController extends AppCycleController {
  final _localize = LocalizeService();
//#region All Override method
  @override
  onInit() async {
    await currentLanguagesAsync();
    super.onInit();
  }
//#endregion

//#region All AppLifeCycle Method
  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}
//#endregion

//#region All Properties
  final _title = ''.obs;
  String get title => _title.value;
  set title(String value) => _title.value = value;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;
  
  // this use only for check background processing(no loading interface)
  final _isBusy = false.obs;
  bool get isBusy => _isBusy.value;
  set isBusy(bool value) => _isBusy.value = value;

  final _languageItem = <LanguageModel>[].obs;
  List<LanguageModel> get languageItem => _languageItem;
  set languageItem(List<LanguageModel> value) => _languageItem.value = value;

  final _languageSelected = LanguageModel().obs;
  LanguageModel get languageSelected => _languageSelected.value;
  set languageSelected(LanguageModel value) => _languageSelected.value = value;

  final _shouldShowValidateMsg = false.obs;
  bool get shouldShowValidateMsg => _shouldShowValidateMsg.value;
  set shouldShowValidateMsg(bool value) => _shouldShowValidateMsg.value = value;

//#endregion

//#region All Navigator Helpers
  Future<String> navigationToNamedAsync(String name) async {
    var result = await Get.toNamed(name);
    return result ?? "";
  }

  Future<String> navigationToNamedArgumentsAsync(String name,
      {dynamic args}) async {
    var result = await Get.toNamed(name, arguments: args);
    return result ?? "";
  }

  Future<String> navigationToOffNamedAsync(String name) async {
    var result = await Get.offNamed(name);
    return result ?? "";
  }

  Future<String> navigationToOffAllNamedAsync(String name,
      {dynamic args}) async {
    var result = await Get.offAllNamed(name, arguments: args);
    return result ?? "";
  }

  Future<dynamic> toScreenAsync(dynamic page, {dynamic args}) async {
    var result = await Get.to(
      page,
      duration: const Duration(milliseconds: 450),
      fullscreenDialog: false,
      transition: Transition.fadeIn,
      arguments: args,
    );
    return result ?? "";
  }
//#endregion

//#region All Method Helpers
  void showLoadingFullScreen() {
    if (!(Get.isDialogOpen ?? false)) {
      Get.dialog(
        useSafeArea: false,
        PopScope(
          canPop: false,
          child: AppLoadingWidget(
            backgroundColor: AppColors.transparent,
          ),
        ),
        barrierDismissible: true,
      );
    }
  }

  void hideLoadingFullScreen() {
    // Navigator.of(Get.context!).pop();
    if (Get.isDialogOpen!) Get.back();
  }

  Future<void> currentLanguagesAsync() async {
    //print("currentLanguagesAsync.......");

    languageItem = [
      LanguageModel.create(0, 'English', false,
          imageSvg: ImagePngUrl.flagEnglish),
      LanguageModel.create(1, 'ភាសាខ្មែរ'.tr, false,
          imageSvg: ImagePngUrl.flagKhmer),
    ];

    try {
      var result = await _localize.getLanguageAsync();

      var languageCode = result.type == 0 ? "en" : "km_KH";
      var countryCode = result.type == 0 ? "US" : "KH";
      var locale = Locale(languageCode, countryCode);
      Get.updateLocale(locale);

      for (var item in languageItem) {
        item.isSelected = item.index == result.type ? true : false;
      }
      languageSelected = languageItem[result.type];
    } catch (e) {
      //Handle all other exceptions
    }
  }

  void chooseLanguageOption() async {
    // print("chooseLanguageOption.......");
    await currentLanguagesAsync();
    var result = await showMaterialModalBottomSheet(
      backgroundColor: Colors.white.withOpacity(0.0),
      context: Get.context!,
      builder: (context) => ListDialog(
        title: 'SelectLanguage'.tr,
        items: languageItem,
        onSelected: (value) => onSelectedValue(value),
      ),
    );
    if (result != null) {
      var languageCode = languageSelected.index == 0 ? "en" : "km_KH";
      var countryCode = languageSelected.index == 0 ? "US" : "KH";
      var locale = Locale(languageCode, countryCode);
      Get.updateLocale(locale);
    }
  }

  void onSelectedValue(LanguageModel value) async {
    // print("onSelectedValue.......");
    languageSelected = value;
    await _localize.updateLocalizeAsync(value.index);
    Get.back(result: languageSelected);
  }

  Future<void> vibrate() async {
    await HapticFeedback.vibrate();
  }

  void delayLoading() {
    isLoading = true;
    Future.delayed(const Duration(milliseconds: 1500)).then(
      (value) => isLoading = false,
    );
  }

//#endregion

//#region All Command
//#endregion
}
