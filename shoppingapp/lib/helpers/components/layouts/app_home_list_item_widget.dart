import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:shoppingapp/core.dart';

class AppHomeListItemWidget extends StatefulWidget {
  const AppHomeListItemWidget({
    super.key,
    required this.title,
    required this.description,
    this.leading,
    this.label = const [],
    this.children,
    this.onTap,
    this.backgroundColor,
    this.borderRadius,
    required this.iconPath,
  });
  final String title;
  final String description;
  final Widget? leading;
  final List<Widget> label;
  final List<Widget>? children;
  final void Function()? onTap;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final String iconPath;

  @override
  State<AppHomeListItemWidget> createState() => _AppHomeListItemWidgetState();
}

class _AppHomeListItemWidgetState extends State<AppHomeListItemWidget> {
  final _onFocus = false.obs;
  bool get onFocus => _onFocus.value;
  set onFocus(bool value) => _onFocus.value = value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      focusColor: Colors.transparent,
      onFocusChange: (b) {
        onFocus = b;
      },
      child: Obx(
        () => Container(
          constraints: BoxConstraints(maxHeight: Get.width),
          decoration: BoxDecoration(
            color: (widget.backgroundColor ?? Colors.white).withOpacity(onFocus?0.5:1),
            borderRadius: widget.borderRadius ??
                BorderRadius.circular(AppSizeStyle.defaultRoundMd),
            border: Border.all(color:onFocus ? AppColors.primary:Colors.transparent),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: const Offset(0, 2),
                blurRadius: 8,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            widget.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 16,
                                color: AppColors.textPrimary,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        if (widget.label.isNotEmpty) ...[
                          ContainerDevider.blankSpaceS,
                          ...widget.label
                        ]
                      ],
                    ),
                    ContainerDevider.blankSpaceS,
                    SizedBox(
                      width: Get.width - 140,
                      child: Text(
                        "${widget.description}\n",
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                    if (widget.children != null) ...[
                      ContainerDevider.blankSpaceM,
                      Wrap(children: widget.children!)
                    ]
                  ],
                ),
              ),
              Positioned(
                right: 10,
                bottom: 0,
                child: Container(
                  height: 70,
                  width: 90,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(),
                  child: SvgPicture.asset(
                    widget.iconPath,
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
