import 'package:flutter/material.dart';
import '../../../../core.dart';

class IndicatorSlide extends StatelessWidget {
  final bool isActive;
  final bool isVideo;
  const IndicatorSlide(this.isActive, {Key? key, this.isVideo = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
          color: isActive ? AppColors.primary : Colors.white,
          borderRadius: const BorderRadius.all(
              Radius.circular(AppSizeStyle.defaultRoundMd))),
    );
    // return isVideo && isActive == false
    //     ? const Padding(
    //         padding: EdgeInsets.symmetric(horizontal: 6),
    //         child: Icon(
    //           Icons.play_arrow,
    //           size: 13,
    //           color: Colors.white,
    //         ),
    //       )
    //     : AnimatedContainer(
    //         duration: const Duration(milliseconds: 150),
    //         margin: const EdgeInsets.symmetric(horizontal: 6),
    //         height: 8,
    //         width: isActive ? 20 : 8,
    //         decoration: BoxDecoration(
    //             color: isActive ? AppColors.primary : Colors.white,
    //             borderRadius: const BorderRadius.all(
    //                 Radius.circular(KSizeStyle.defaultRoundMd))),
    //       );
  }
}
