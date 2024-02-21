import 'package:flutter/cupertino.dart';
import 'package:shoppingapp/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/views/homes/home_brand_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // ignore: unused_field
  final _controller = Get.put(HomeScreenController());
  bool smallScreen = Get.height < 600;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _appTitle,
        actions: [
          AppButton.circle(
            iconData: CupertinoIcons.bag,
            color: AppColors.itemBackgroundColro,
            iconColor: AppColors.textPrimary,
            onPressed: () {
              _controller.getProductAsync();
            },
          ),
          AppDevider.blankSpaceL,
        ],
      ),
      backgroundColor: Colors.white,
      body: bodyBuilder(),
    );
  }

  Widget bodyBuilder() {
    return Obx(
      () => ListView(
        padding: EdgeInsets.zero,
        children: [
          AppDevider.blankSpaceL,
          HomeBrandView(brandList: _controller.brandList),
          AppDevider.blankSpaceL,
          HomeProductView(),
        ],
      ),
    );
  }

  Widget get _appTitle => RichText(
        text: TextSpan(
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
            fontSize: 21,
          ),
          children: [
            TextSpan(
              text: "${_controller.userName} \n",
            ),
            TextSpan(
              text:
                  "WellcomeToAppName".tr.replaceAll("AppName", "Shopping App"),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: AppColors.textSubTitleF12,
              ),
            ),
          ],
        ),
      );
}
