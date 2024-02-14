import 'package:shoppingapp/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'bottom_sheets/x_bottom_sheets.dart';

class AppChoiceDialog {
  static Future<void> ok({
    required String title,
    required String message,
    Widget? child,
    VoidCallback? ok,
    String? buttonTitle,
    bool barrierDismissible = true,
  }) async {
    await Get.dialog(
        _CAlertActionDialog(
          title: title,
          message: message,
          action: [
            Expanded(
                child: TextButton(
                    onPressed: ok ?? Get.back,
                    style: primaryButtonButtonStyle(),
                    child: Text(
                      buttonTitle ?? 'Okay'.tr,
                      style: _primaryTextStyle(),
                    )))
          ],
          child: child,
        ),
        barrierDismissible: barrierDismissible);
  }

  void noYes(
      {required title,
      required message,
      VoidCallback? no,
      required VoidCallback yes}) async {
    await Get.dialog(_CAlertActionDialog(
      title: title,
      message: message,
      action: [
        Expanded(
            child: ElevatedButton(
                onPressed: no ?? Get.back,
                style: primaryButtonButtonStyle(),
                child: Text(
                  'No'.tr,
                  style: _primaryTextStyle(),
                ))),
        const SizedBox(
          width: 5,
        ),
        Expanded(
            child: ElevatedButton(
                onPressed: yes,
                style: secondaryButtonStyle(),
                child: Text(
                  'Yes'.tr,
                  style: _secondaryTextStyle(),
                ))),
      ],
    ));
  }

  Future<void> alertVerticalActions(
      {required String title,
      required String message,
      String? cancelTitle,
      String? acceptTitle,
      VoidCallback? cancel,
      required VoidCallback accept}) async {
    await Get.dialog(_CVerticalActionsDialog(
      title: title,
      message: message,
      isGestureDetectorEnable: false,
      action: [
        ElevatedButton(
            onPressed: accept,
            style: secondaryButtonStyle().copyWith(
              padding: MaterialStateProperty.all(
                const EdgeInsets.only(bottom: 10, top: 20),
              ),
            ),
            child: Text(
              acceptTitle ?? "",
              style: _primaryTextStyle(),
            )),
        ElevatedButton(
            onPressed: cancel ?? Get.back,
            style: secondaryButtonStyle().copyWith(
              padding: MaterialStateProperty.all(
                const EdgeInsets.only(bottom: 20, top: 10),
              ),
            ),
            child: Text(
              cancelTitle ?? "",
              style: _secondaryTextStyle(),
            )),
      ],
    ));
  }

  static Future<void> alert(
      {required String title,
      required String message,
      String? cancelTitle,
      String? acceptTitle,
      VoidCallback? cancel,
      required VoidCallback accept}) async {
    await Get.dialog(_CAlertActionDialog(
      title: title,
      message: message,
      isGestureDetectorEnable: false,
      action: [
        Expanded(
            child: ElevatedButton(
                onPressed: cancel ?? Get.back,
                style: secondaryButtonStyle(),
                child: Text(
                  (cancelTitle ?? "Cancel".tr).toUpperCase(),
                  style: _secondaryTextStyle(),
                ))),
        const SizedBox(
          width: 5,
        ),
        Expanded(
            child: ElevatedButton(
                onPressed: accept,
                style: primaryButtonButtonStyle(),
                child: Text(
                  (acceptTitle ?? "Confirm".tr).toUpperCase(),
                  style: _primaryTextStyle(),
                ))),
      ],
    ));
  }

  static void okCancel(
      {required title,
      required message,
      Widget? child,
      String? okTitle,
      String? cancelTitle,
      VoidCallback? onCancel,
      required VoidCallback onOk}) async {
    await Get.dialog(_CAlertActionDialog(
      title: title,
      message: message,
      action: [
        Expanded(
            child: ElevatedButton(
                onPressed: onCancel ?? Get.back,
                style: secondaryButtonStyle(),
                child: Text(
                  (cancelTitle ?? 'Cancel'.tr).toUpperCase(),
                  style: _secondaryTextStyle(),
                ))),
        const SizedBox(
          width: 5,
        ),
        Expanded(
            child: ElevatedButton(
                onPressed: onOk,
                style: primaryButtonButtonStyle(),
                child: Text(
                  (okTitle ?? 'Okay'.tr).toUpperCase(),
                  style: _primaryTextStyle(),
                ))),
      ],
      child: child,
    ));
  }

  // static Future<void> alertBottomSheetVerticalActions(
  //     {required String title,
  //     required String message,
  //     String? cancelTitle,
  //     String? acceptTitle,
  //     bool hasCancel = true,
  //     Widget? child,
  //     VoidCallback? cancel,
  //     required VoidCallback accept}) async {
  //   await showCupertinoModalBottomSheet(
  //     barrierColor: Colors.black.withOpacity(.5),
  //     context: Get.context!,
  //     backgroundColor: Colors.transparent,
  //     topRadius: const Radius.circular(30),
  //     builder: (context) => BlankContentBottomSheetWidget(
  //       title: title,
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 15),
  //         child: Column(
  //           children: [
  //             child ?? Text(message),
  //             const SizedBox(
  //               height: 20,
  //             ),
  //             AppButton.primaryButton(
  //               label: (acceptTitle ?? "Continues".tr).toUpperCase(),
  //               onPressed: accept,
  //             ),
  //             const SizedBox(
  //               height: 5,
  //             ),
  //             Visibility(
  //               visible: hasCancel,
  //               child: TextButton(
  //                 onPressed: cancel ?? Get.back,
  //                 child: SizedBox(
  //                   width: double.infinity,
  //                   height: 44,
  //                   child: Center(
  //                     child: Text(
  //                       (cancelTitle ?? "Cancel".tr).toUpperCase(),
  //                       style: const TextStyle(
  //                         color: Color(0xff3a3a3a),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             SizedBox(
  //                 height: MediaQuery.of(context).viewPadding.bottom * 0.5 + 20),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

//style
  static TextStyle _secondaryTextStyle() =>
      const TextStyle(color: Colors.grey, fontFamily: AppFonts.outletFamily);
  static ButtonStyle secondaryButtonStyle() {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 20, vertical: 17)),
        textStyle: MaterialStateProperty.all(const TextStyle(
            color: AppColors.primary, fontFamily: AppFonts.outletFamily)),
        overlayColor:
            MaterialStateProperty.all(AppColors.primary.withOpacity(0.1)),
        elevation: MaterialStateProperty.all(0));
  }

  static TextStyle _primaryTextStyle() => const TextStyle(
      color: AppColors.primary,
      fontWeight: FontWeight.w700,
      fontFamily: AppFonts.outletFamily);
  static ButtonStyle primaryButtonButtonStyle() {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 20, vertical: 17)),
        textStyle: MaterialStateProperty.all(const TextStyle(
            color: Colors.white, fontFamily: AppFonts.outletFamily)),
        overlayColor:
            MaterialStateProperty.all(AppColors.primary.withOpacity(0.1)),
        elevation: MaterialStateProperty.all(0));
  }
}

class _CVerticalActionsDialog extends StatelessWidget {
  const _CVerticalActionsDialog(
      {Key? key,
      required this.title,
      required this.message,
      this.isGestureDetectorEnable = true,
      this.action = const []})
      : super(key: key);

  final String title;
  final String message;
  final List<Widget> action;
  final bool isGestureDetectorEnable;

  @override
  Widget build(BuildContext context) {
    return _dialogBuilder();
  }

  Widget _dialogBuilder() {
    return Align(
      child: Container(
        margin: const EdgeInsets.all(20),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 5),
            // header
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                title,
                style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 17,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFonts.outletFamily),
                textAlign: TextAlign.center,
              ),
            ),
            //body
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                message,
                style: const TextStyle(
                    color: AppColors.textPrimary,
                    decoration: TextDecoration.none,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFonts.outletFamily),
                textAlign: TextAlign.center,
              ),
            ),
            //action
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: action,
            ),
          ],
        ),
      ),
    );
  }
}

class _CAlertActionDialog extends StatelessWidget {
  const _CAlertActionDialog(
      {Key? key,
      required this.title,
      required this.message,
      this.child,
      this.isGestureDetectorEnable = true,
      this.action = const []})
      : super(key: key);

  final String title;
  final String message;
  final Widget? child;
  final List<Widget> action;
  final bool isGestureDetectorEnable;

  @override
  Widget build(BuildContext context) {
    return _dialogBuilder();
  }

  Widget _dialogBuilder() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.all(20),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 5),
            // header
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                title,
                style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 17,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFonts.outletFamily),
                textAlign: TextAlign.center,
              ),
            ),
            //body
            Padding(
              padding: const EdgeInsets.all(10),
              child: child ??
                  Text(
                    message,
                    style: const TextStyle(
                        color: AppColors.textPrimary,
                        decoration: TextDecoration.none,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.outletFamily),
                    textAlign: TextAlign.center,
                  ),
            ),
            //action
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: action,
            ),
          ],
        ),
      ),
    );
  }
}
