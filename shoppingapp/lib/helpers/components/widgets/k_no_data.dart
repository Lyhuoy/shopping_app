import 'package:shoppingapp/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class KNoData extends StatefulWidget {
  final KNoDataForScreen forScreen;
  final String? text;
  final bool isRepeat;
  final double? size;
  final double textSize;
  const KNoData({
    Key? key,
    this.forScreen = KNoDataForScreen.defualt,
    this.isRepeat = true,
    this.text,
    this.textSize = 25,
    this.size,
  }) : super(key: key);

  @override
  State<KNoData> createState() => _KNoDataState();
}

class _KNoDataState extends State<KNoData> {
  String assetLink = ImageJsonUrl.noData;
  @override
  void initState() {
    if (widget.forScreen != KNoDataForScreen.defualt) {
      setState(() {
        assetLink = getAssetinString();
      });
    }
    super.initState();
  }

  String getAssetinString() {
    var result = ImageJsonUrl.noData;
    switch (widget.forScreen) {
      default:
        result = ImageJsonUrl.noData;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        constraints:
            BoxConstraints(maxHeight: Get.height - 200, maxWidth: Get.width),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: const BoxConstraints(maxHeight: 300),
              child: Lottie.asset(assetLink,
                  repeat: widget.isRepeat,
                  width: widget.size ?? Get.width * 0.55),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.text ?? "NODATA".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: widget.textSize,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ));
  }
}

enum KNoDataForScreen { defualt }
