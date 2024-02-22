import 'package:shoppingapp/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagePickerDialog extends StatelessWidget {
  const ImagePickerDialog({
    Key? key,
    required this.onTakePressed,
    required this.onLibraryPressed,
  }) : super(key: key);

  final GestureTapCallback onTakePressed;
  final GestureTapCallback onLibraryPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Ink(
            width: Get.width,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppDevider.blankSpaceS,
                Text(
                  "UploadImage".tr,
                  style: AppTextStyle.title,
                ),
                AppDevider.blankSpaceS,
                TextButton(
                  onPressed: onTakePressed,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.camera_enhance,
                          color: AppColors.textPrimary,
                          size: 16,
                        ),
                        AppDevider.blankSpaceL,
                        Text(
                          'TakePhoto'.tr,
                          textAlign: TextAlign.start,
                          style: AppTextStyle.body,
                        )
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: onLibraryPressed,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.image,
                          color: AppColors.textPrimary,
                          size: 16,
                        ),
                        AppDevider.blankSpaceL,
                        Text(
                          'BrowseFromPhone'.tr,
                          textAlign: TextAlign.start,
                          style: AppTextStyle.body,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
