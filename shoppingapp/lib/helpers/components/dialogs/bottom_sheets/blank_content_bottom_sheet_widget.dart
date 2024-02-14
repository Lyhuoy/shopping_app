import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/core.dart';

class BlankContentBottomSheetWidget extends StatelessWidget {
  final ScrollController scrollController = ScrollController();

  BlankContentBottomSheetWidget({super.key, required this.child, this.title});

  final Widget child;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Container(
          // padding: const EdgeInsets.all(15),
          constraints: BoxConstraints(maxHeight: Get.height *85),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppSizeStyle.defaultRoundSm)
          ),
          child: Stack(
            children: [
              // SingleChildScrollView(
              //   controller: scrollController,
              //   physics: const BouncingScrollPhysics(),
              //   child: child,
              // ),
              child,
              
              if(title!=null)...[
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainerDevider.blankSpaceX,
                  Text(title ?? ''),
                  const CloseButton(
                    color: Colors.grey,
                  ),
                ],
              )
              ]
            ],
          ),
        ),
    );
  }
}
