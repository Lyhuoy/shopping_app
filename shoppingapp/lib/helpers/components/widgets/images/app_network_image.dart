import 'package:shoppingapp/core.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletons/skeletons.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final Widget? errorWidget;
  final BoxShape shap;
  final BoxFit fit;
  final double roundCordner;

  const AppNetworkImage(
    this.imageUrl, {
    Key? key,
    this.width,
    this.height,
    this.errorWidget,
    this.fit = BoxFit.cover,
    this.shap = BoxShape.rectangle,
    this.roundCordner = AppSizeStyle.defaultRoundLg
  }) : super(key: key);

  // const BorderRadius.all(
  //               Radius.circular(AppSizeStyle.defaultRoundLg),
  //             )

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: shap,
        borderRadius: shap == BoxShape.rectangle
            ? BorderRadius.all(Radius.circular(roundCordner))
            : null,
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        errorWidget: (context, url, error) =>
            errorWidget ??
            SvgPicture.asset(
              ImageSvgUrl.errorholder,
              fit: BoxFit.cover,
              color: AppColors.primary.withAlpha(100),
              width: width,
              height: height,
            ),
        placeholder: (context, url) =>const SkeletonAvatar(
          style: SkeletonAvatarStyle(),
        ),
      ),
    );
  }
}
