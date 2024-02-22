import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/core.dart';
import 'package:shoppingapp/views/products/product_detail_screen.dart';

class HomeProductView extends StatelessWidget {
  HomeProductView({
    super.key,
  });
  // final List<ProductDetailModel> prodcutList;
  final _controller = Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            _headerBuilder,
            AppDevider.blankSpaceM,
            _listBuilder(_controller.homeProduct),
          ],
        ));
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
      itemCount: productList.length,
      itemBuilder: (context, index) {
        return _productItemBuilder(productList.elementAt(index));
      },
    );
  }

  Widget _productItemBuilder(ProductDetailModel item) {
    return InkWell(
      onTap: () {
        Get.to(ProductDetailScreen(item: item,));
      },
      child: Container(
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
                Positioned(
                  child: Icon(CupertinoIcons.heart),
                  top: 20,
                  right: 20,
                )
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
                item.price
                    .fromGenricToString(AppDecimalFormatConst.amountFormat),
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                )),
            AppDevider.blankSpaceM,
          ],
        ),
      ),
    );
  }
}
