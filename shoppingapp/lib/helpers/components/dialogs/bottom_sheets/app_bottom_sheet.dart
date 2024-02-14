import 'package:shoppingapp/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AppBottomSheet {
  static Future<void> bottomSheetSelectDynamicOption<T>({
    String title = "Title",
    required List<T> items,
    T? selectedItem,
    required OnSelectedCBottomSheet<T> onSelectedItem,
    required CBottomSheetChild<T> itemBuilder,
    Widget? separator,
    bool closeOnSelect = false,
    Decoration? selectedItemDecoration,
    Color? barrierBackground,
    Color iconColor = AppColors.primary,
  }) async {
    await showMaterialModalBottomSheet(
      context: Get.context!,
      backgroundColor: Colors.transparent,
      barrierColor: barrierBackground ?? AppColors.barrierBackground,
      builder: (_) {
        return SelectDynamicOptionWidget<T>(
          title: title,
          items: items,
          builder: itemBuilder,
          selectedItem: selectedItem,
          onSelectedItem: onSelectedItem,
          separatorBuilder: separator,
          closeOnSelect: closeOnSelect,
          selectedItemDecoration: selectedItemDecoration,
          iconColor: iconColor,
        );
      },
    );
  }

  static Future<T?> bottomSheetBlankContent<T>(
    Widget child, {
    Color? barrierBackground,
    EdgeInsets? containPadding,
    bool enableDrag = true,
  }) async {
    return await showCupertinoModalBottomSheet(
        barrierColor: barrierBackground ?? AppColors.barrierBackground,
        backgroundColor: Colors.transparent,
        shadow: const BoxShadow(color: Colors.transparent),
        elevation: 0,
        topRadius: const Radius.circular(AppSizeStyle.defaultRoundMd),
        enableDrag: enableDrag,
        context: Get.context!,
        builder: (context) {
          return Material(
            color: Colors.white,
            child: Padding(
              padding: MediaQuery.of(Get.context!).viewInsets,
              child: InkWell(
                onTap: Get.back,
                splashColor: Colors.transparent,
                overlayColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                child: SafeArea(
                  minimum: containPadding ?? EdgeInsets.zero,
                  child: InkWell(
                    onTap: () {},
                    child: BlankContentBottomSheetWidget(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: child,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
