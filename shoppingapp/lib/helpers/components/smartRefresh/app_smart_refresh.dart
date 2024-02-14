import 'package:shoppingapp/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AppSmartRefresh {
  static AppSmartRefresh shared = AppSmartRefresh();

  // final homeHeader = ClassicHeader(
  //     textStyle: const TextStyle(color: Colors.white),
  //     idleIcon: const Icon(
  //       OutletAppIcon.arrowDown,
  //       color: Colors.white,
  //       size: 14,
  //     ),
  //     releaseIcon: const Icon(
  //       OutletAppIcon.rotateCw,
  //       color: Colors.white,
  //       size: 14,
  //     ),
  //     releaseText: 'ReleaseToReloadData'.tr,
  //     idleText: 'PullDownToReloadData'.tr,
  //     refreshingText: "${'Reloading'.tr}...",
  //     refreshingIcon: SizedBox(
  //         height: 17,
  //         width: 17,
  //         child: GetPlatform.isAndroid
  //             ? const CircularProgressIndicator(
  //                 strokeWidth: 2,
  //                 color: Colors.white,
  //                 backgroundColor: Colors.transparent,
  //               )
  //             : const CupertinoActivityIndicator(color: Colors.white)));

  Widget get pullRefreshHeader => const MaterialClassicHeader(
      offset: 10, color: AppColors.primary, backgroundColor: Colors.white);

  Widget get homeHeader => ClassicHeader(
      textStyle: const TextStyle(color: Colors.white),
      idleIcon: const Icon(
        Icons.arrow_downward,
        color: Colors.white,
        size: 14,
      ),
      completeIcon: const Icon(
        Icons.check,
        color: Colors.white,
        size: 14,
      ),
      releaseIcon: const Icon(
        Icons.rotate_left,
        color: Colors.white,
        size: 14,
      ),
      completeText: 'RefreshCompleted'.tr,
      releaseText: 'ReleaseToReloadData'.tr,
      idleText: 'PullDownToReloadData'.tr,
      refreshingText: "${'Reloading'.tr}...",
      refreshingIcon: SizedBox(
          height: 17,
          width: 17,
          child: GetPlatform.isAndroid
              ? const CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                  backgroundColor: Colors.transparent,
                )
              : const CupertinoActivityIndicator(color: Colors.white)));

  Widget get generalHeader => ClassicHeader(
        textStyle: const TextStyle(color: AppColors.primary, fontSize: 14),
        idleIcon: const Icon(
        Icons.arrow_downward,
          color: AppColors.primary,
          size: 17,
        ),
        releaseIcon: const Icon(
        Icons.check,
          color: AppColors.primary,
          size: 17,
        ),
        completeIcon: const Icon(
        Icons.rotate_left,
          color: AppColors.primary,
          size: 17,
        ),
        completeText: 'RefreshCompleted'.tr,
        releaseText: 'ReleaseToReloadData'.tr,
        idleText: 'PullDownToReloadData'.tr,
        refreshingText: "${'Reloading'.tr}...",
        refreshingIcon: SizedBox(
          height: 17,
          width: 17,
          child: GetPlatform.isAndroid
              ? const CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.primary,
                  backgroundColor: Colors.transparent,
                )
              : const CupertinoActivityIndicator(
                  color: AppColors.primary,
                ),
        ),
      );

  Widget get homeFooter => CustomFooter(
        builder: (context, mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.arrow_upward,
                      color: AppColors.primary,
                      size: 24.0,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "PullUpLoadMore".tr,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontFamily: AppFonts.outletFamily, fontSize: 14),
                    )
                  ],
                ));
          } else if (mode == LoadStatus.loading) {
            body = Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 20,
                        width: 20,
                        child: GetPlatform.isAndroid
                            ? const CircularProgressIndicator(
                                backgroundColor: Colors.transparent,
                                strokeWidth: 2.0,
                                color: AppColors.primary,
                              )
                            : const CupertinoActivityIndicator(
                                color: AppColors.primary)),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "Loading".tr,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontFamily: AppFonts.outletFamily, fontSize: 14),
                    )
                  ],
                ));
          } else if (mode == LoadStatus.canLoading) {
            body = Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.loop_rounded,
                      color: AppColors.primary,
                      size: 24.0,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "ReleaseToLoadMore".tr,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontFamily: AppFonts.outletFamily, fontSize: 14),
                    )
                  ],
                ));
          } else {
            body = const SizedBox();
          }
          return body;
        },
      );

  Widget get footer => ClassicFooter(
        loadingText: 'Loading'.tr,
        loadingIcon:  SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.primary,
                backgroundColor: AppColors.primary.withOpacity(0.5))),
        canLoadingIcon: Icon(Icons.refresh, size: 15, color: AppColors.primary.withOpacity(0.5)),
        canLoadingText: 'ReleaseToLoadMore'.tr,
        idleText: 'PullUpToLoadMore'.tr,
        loadStyle: LoadStyle.ShowWhenLoading,
        noDataText: 'NoData'.tr,
      );
}
