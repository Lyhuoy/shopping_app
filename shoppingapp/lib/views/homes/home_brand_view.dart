import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/core.dart';

class HomeBrandView extends StatelessWidget {
  const HomeBrandView({
    super.key,
    required this.brandList,
  });
  final List<BrandModel> brandList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _headerBuilder,
        AppDevider.blankSpaceM,
        _listBuilder(brandList),
      ],
    );
  }

  Widget get _headerBuilder => Row(
        children: [
          AppDevider.blankSpaceL,
          Text("ChooseBrand".tr),
          AppDevider.blankSpaceExpanded(),
          InkWell(
            onTap: () => Get.toNamed(AppRoutes.brandListScreen),
            child: Text(
              "ViweAll".tr,
              style: const TextStyle(color: AppColors.textSecondary),
            ),
          ),
          AppDevider.blankSpaceL,
        ],
      );

  Widget _listBuilder(List<BrandModel> brandList) {
    return SizedBox(
      width: Get.width,
      height: 50,
      child: ListView.separated(
        itemCount: brandList.length,
        itemBuilder: (context, index) => _brandItemBuilder(
          brandList.elementAt(index),
        ),
        separatorBuilder: (context, index) => AppDevider.blankSpaceL,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 15),
      ),
    );
  }

  Widget _brandItemBuilder(BrandModel item) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.itemBackgroundColro,
        borderRadius: BorderRadius.circular(AppSizeStyle.defaultRoundMd),
      ),
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          AppNetworkImage(
            color: Colors.white,
            item.photoUrl,
            roundCordner: AppSizeStyle.defaultRoundMd,
            fit: BoxFit.contain,
            width: 40,
            height: 40,
          ),
          AppDevider.blankSpaceM,
          Text(item.name, style: const TextStyle(color: AppColors.textPrimary)),
          AppDevider.blankSpaceM,
        ],
      ),
    );
  }
}
