import 'dart:ui';

import 'package:shoppingapp/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreenDrawer extends StatelessWidget {
  HomeScreenDrawer({super.key});
  final HomeScreenController _controller = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      // Use [SystemUiOverlayStyle.light] for white status bar
      // or [SystemUiOverlayStyle.dark] for black status bar
      // https://stackoverflow.com/a/58132007/1321917
      value: AppColors.darkSystemUiOverlayStyle,
      child: Container(
        height: Get.height,
        color: AppColors.pageBackground,
        child: SafeArea(
          top: false,
          child: Stack(
            children: [
              Positioned.fill(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _userProfile(),
                      ContainerDevider.blankSpaceL,
                      ContainerDevider.blankSpaceL,
                      HomeScreenDrawerListItem(
                          onTap: () => _controller.logout(),
                          trialing: const Icon(
                            Icons.power_settings_new_rounded,
                            color: AppColors.error,
                            size: 18,
                          ),
                          label: "${"Logout".tr} ",
                          labelColor: AppColors.error,
                          margin: const EdgeInsets.symmetric(horizontal: 15)),
                      ContainerDevider.blankSpaceL,
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: SafeArea(
                  minimum: const EdgeInsets.all(5),
                  child: AppButton.circle(
                    color: Colors.transparent,
                    iconColor: Colors.white,
                    onPressed: () => Get.back(),
                    iconData: Icons.close,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _userProfile() {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                  color: AppColors.primary,
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://static.mothership.sg/1/2023/06/IMG_0931.jpg",
                    ),
                    fit: BoxFit.cover,
                  )),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 20,
                  sigmaY: 20,
                  tileMode: TileMode.mirror,
                ),
                child: Container(
                  decoration: BoxDecoration(color: Colors.black.withOpacity(0.55)),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Container(
                      height: 100,
                      width: 100,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amber,
                          border: Border.all(
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: Colors.white,
                          )),
                      child: Image.network(
                        "https://static.mothership.sg/1/2023/06/IMG_0931.jpg",
                        errorBuilder: (context, error, stackTrace) => const Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    ContainerDevider.blankSpaceM,
                    Text(
                      "Username",
                      style: AppTextStyle.header.copyWith(fontSize: 22),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
