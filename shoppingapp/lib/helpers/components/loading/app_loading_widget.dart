import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/core.dart';
import 'package:skeletons/skeletons.dart';


///
/// better to have [buildContext] becuase it is use to get hieght and width
///
class AppLoadingWidget extends StatefulWidget {
  final KLoadingStyle loadingStyle;
  final Color backgroundColor;
  final BuildContext? buildContext;
  const AppLoadingWidget(
      {Key? key,
      this.loadingStyle = KLoadingStyle.circleProgress,
      this.backgroundColor = Colors.white,
      this.buildContext})
      : super(key: key);

  @override
  State<AppLoadingWidget> createState() => _AppLoadingWidgetState();
}

class _AppLoadingWidgetState extends State<AppLoadingWidget> {
  double width = double.infinity;
  double height = double.infinity;
  Widget loadingWidget = Center(
    child: AppLoading.indicatorWidget(),
  );

  Widget checkStyle() {
    Widget result;
    switch (widget.loadingStyle) {
      case KLoadingStyle.skeletonList:
        result = SkeletonListView();
        break;
      case KLoadingStyle.skeletonAvatarRec:
        result = SkeletonAvatar(
          style: SkeletonAvatarStyle(
              shape: BoxShape.rectangle, width: width, height: height),
        );
        break;
      case KLoadingStyle.skeletonAvatarCircle:
        result = SkeletonAvatar(
          style: SkeletonAvatarStyle(
              shape: BoxShape.circle, width: width, height: height),
        );
        break;
      case KLoadingStyle.sHomeScreen:
        result = sHomeScreenWidget();
        break;
      case KLoadingStyle.sProductDetail:
        result = sProductDetailWidget();
        break;
      case KLoadingStyle.sProductList:
        result = sProductListWidget();
        break;

      case KLoadingStyle.sVoucherList:
        result = sVoucherListWidget();
        break;
      default:
        result = loadingWidget;
    }
    return result;
  }

  @override
  void initState() {
    if (widget.buildContext != null) {
      height = MediaQuery.of(widget.buildContext!).size.height;
      width = MediaQuery.of(widget.buildContext!).size.width;
    }
    if (widget.loadingStyle != KLoadingStyle.circleProgress) {
      loadingWidget = checkStyle();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      child: loadingWidget,
    );
  }

  Widget sVoucherListWidget() {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
          itemBuilder: (context, index) => const SkeletonAvatar(
            style: SkeletonAvatarStyle(
              shape: BoxShape.rectangle,
              height: 168,
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 15,
          ),
          itemCount: 7,
        ),
      ),
    );
  }

  Widget sProductDetailWidget() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(AppSizeStyle.listPaddingMd, 0,
          AppSizeStyle.listPaddingMd, AppSizeStyle.listPaddingMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          SkeletonAvatar(
              style: SkeletonAvatarStyle(
                  padding: EdgeInsets.only(right: 250),
                  shape: BoxShape.rectangle,
                  height: 12,
                  maxWidth: 60)),
          SizedBox(height: 20),
          SkeletonAvatar(
              style: SkeletonAvatarStyle(
                  padding: EdgeInsets.only(right: 90),
                  shape: BoxShape.rectangle,
                  height: 12,
                  maxWidth: 60)),
          SizedBox(height: 10),
          SkeletonAvatar(
              style: SkeletonAvatarStyle(
                  shape: BoxShape.rectangle, height: 12, maxWidth: 60)),
          SizedBox(height: 20),
          SkeletonAvatar(
              style: SkeletonAvatarStyle(
                  shape: BoxShape.rectangle, height: 12, maxWidth: 60)),
          SizedBox(height: 10),
          SkeletonAvatar(
              style: SkeletonAvatarStyle(
                  shape: BoxShape.rectangle, height: 12, maxWidth: 60)),
          SizedBox(height: 10),
          SkeletonAvatar(
              style: SkeletonAvatarStyle(
                  shape: BoxShape.rectangle, height: 12, maxWidth: 60)),
          SizedBox(height: 10),
          SkeletonAvatar(
              style: SkeletonAvatarStyle(
                  shape: BoxShape.rectangle, height: 12, maxWidth: 60)),
          SizedBox(height: 10),
          SkeletonAvatar(
              style: SkeletonAvatarStyle(
                  shape: BoxShape.rectangle, height: 12, maxWidth: 60)),
          SizedBox(height: 10),
          SkeletonAvatar(
              style: SkeletonAvatarStyle(
                  shape: BoxShape.rectangle, height: 12, maxWidth: 60)),
          SizedBox(height: 10),
          SkeletonAvatar(
              style: SkeletonAvatarStyle(
                  shape: BoxShape.rectangle, height: 12, maxWidth: 60)),
          SizedBox(height: 20),
          SkeletonAvatar(
              style: SkeletonAvatarStyle(
                  shape: BoxShape.rectangle, height: 12, maxWidth: 60)),
        ],
      ),
    );
  }

  Widget sHomeScreenWidget() {
    return SingleChildScrollView(
      child: SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(AppSizeStyle.listPaddingMd),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SkeletonAvatar(
                style:
                    SkeletonAvatarStyle(shape: BoxShape.rectangle, height: 140),
              ),
              // SizedBox(height: 100, width: width, child: _categoryRow),
              _categoryRow,
              _categoryRow,
              _title,
              _proRow,
              _proRow,
              _proRow,
              _proRow,
              _proRow,
              _proRow,
              _proRow,
            ],
          ),
        ),
      ),
    );
  }

  Widget sProductListWidget() {
    return SingleChildScrollView(
      child: SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(AppSizeStyle.listPaddingMd),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _proRow,
              _proRow,
              _proRow,
            ],
          ),
        ),
      ),
    );
  }

  static const Widget _categoryRow = Padding(
      padding: EdgeInsets.all(AppSizeStyle.listPaddingMd),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _categoryItem,
          SizedBox(width: 10),
          _categoryItem,
          SizedBox(width: 10),
          _categoryItem,
          SizedBox(width: 10),
          _categoryItem,
          SizedBox(width: 10),
          _categoryItem,
        ],
      ));

  static const Widget _categoryItem = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SkeletonAvatar(
            style: SkeletonAvatarStyle(
          shape: BoxShape.circle,
          height: 70,
        )),
        SkeletonAvatar(
            style: SkeletonAvatarStyle(shape: BoxShape.rectangle, height: 10))
      ]);

  static const Widget _title = Padding(
      padding: EdgeInsets.all(AppSizeStyle.listPaddingMd),
      child: SizedBox(
          width: 70,
          height: 15,
          child: SkeletonAvatar(
              style: SkeletonAvatarStyle(
                  padding: EdgeInsets.only(right: 300),
                  shape: BoxShape.rectangle,
                  height: 15,
                  maxWidth: 60))));

  static final Widget _proRow = Padding(
      padding: const EdgeInsets.all(AppSizeStyle.listPaddingMd),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_pro, _pro],
      ));

  static final Widget _pro = Container(
    constraints: BoxConstraints(
      maxHeight: 230,
      maxWidth: (Get.width - 60) / 2,
    ),
    child: const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SkeletonAvatar(
            style: SkeletonAvatarStyle(shape: BoxShape.rectangle, height: 165)),
        SizedBox(height: 5),
        SkeletonAvatar(
            style: SkeletonAvatarStyle(shape: BoxShape.rectangle, height: 11)),
        SizedBox(height: 5),
        SizedBox(
          height: 10,
          width: 90,
          child: SkeletonAvatar(
              style: SkeletonAvatarStyle(
                  padding: EdgeInsets.only(right: AppSizeStyle.defaultRoundSm),
                  shape: BoxShape.rectangle,
                  height: 10,
                  maxWidth: 90)),
        ),
        SizedBox(height: 5),
        SizedBox(
            height: 15,
            width: 40,
            child: SkeletonAvatar(
                style: SkeletonAvatarStyle(
                    padding: EdgeInsets.only(right: 70),
                    shape: BoxShape.rectangle,
                    height: 15,
                    maxWidth: 60)))
      ],
    ),
  );
}

enum KLoadingStyle {
  circleProgress,
  skeletonList,
  skeletonAvatarCircle,
  skeletonAvatarRec,
  sHomeScreen,
  sProductDetail,
  sProductList,
  sVoucherList,
}
