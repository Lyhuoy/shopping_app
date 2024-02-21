import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/core.dart';

class HomeProductView extends StatelessWidget {
  const HomeProductView({
    super.key,
    required this.prodcutList,
  });
  final List<ProductDetailModel> prodcutList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _headerBuilder,
        AppDevider.blankSpaceM,
        _listBuilder(prodcutList),
      ],
    );
  }

  Widget get _headerBuilder => Row(
        children: [
          AppDevider.blankSpaceL,
          Text("NewArraival".tr),
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

  Widget _listBuilder(List<ProductDetailModel> productList) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 15,
        mainAxisSpacing: 0,
      ),
      itemCount: prodcutList.length,
      itemBuilder: (context, index) {
        return _productItemBuilder(productList.elementAt(index));
      },
    );
  }

  Widget _productItemBuilder(ProductDetailModel item) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizeStyle.defaultRoundMd),
      ),
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AppNetworkImage(
                color: Colors.white,
                item.photoUrl,
                roundCordner: AppSizeStyle.defaultRoundMd,
                fit: BoxFit.contain,
              ),
              Positioned(child: Icon(CupertinoIcons.heart), top: 20, right: 20,)
            ],
          ),
          AppDevider.blankSpaceM,
          Text(
            item.name,
            style: const TextStyle(color: AppColors.textPrimary),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          AppDevider.blankSpaceExpanded(),
          Text(
              item.price.fromGenricToString(AppDecimalFormatConst.amountFormat),
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              )),
          AppDevider.blankSpaceM,
        ],
      ),
    );
  }
}
