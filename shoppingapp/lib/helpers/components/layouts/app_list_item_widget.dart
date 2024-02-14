// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shoppingapp/core.dart';

class AppListListItemWidget extends StatefulWidget {
  const AppListListItemWidget({
    super.key,
    this.title,
    this.description,
    this.trailing,
    this.leading,
    this.label,
    this.children,
    this.onTap,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.padding,
    this.backgroundColor,
    this.boxShadow,
    this.contentPadding,
    this.child,
    this.borderRadius,
  });
  final String? title;
  final String? description;
  final Widget? child;
  final Widget? trailing;
  final Widget? leading;
  final List<Widget>? label;
  final List<Widget>? children;
  final void Function()? onTap;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final Color? backgroundColor;
  final List<BoxShadow>? boxShadow;

  /// Default value = BorderRadius.circular(AppSizeStyle.defaultRoundMd)
  final BorderRadius? borderRadius;

  @override
  State<AppListListItemWidget> createState() => _AppListListItemWidgetState();
}

class _AppListListItemWidgetState extends State<AppListListItemWidget> {
  bool onFocus = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      focusColor: Colors.transparent,
      onFocusChange: (b) {
        setState(() {
          onFocus = b;
        });
      },
      child: Container(
          padding: widget.padding ?? const EdgeInsets.all(15),
          constraints: BoxConstraints(maxHeight: Get.width),
          decoration: BoxDecoration(
            // color: widget.backgroundColor ?? Colors.white,
            color: (widget.backgroundColor ?? Colors.white)
                .withOpacity(widget.onTap != null && onFocus ? 0.5 : 1),
            borderRadius: widget.borderRadius ??
                BorderRadius.circular(AppSizeStyle.defaultRoundMd),
            border: Border.all(
                color: widget.onTap != null && onFocus
                    ? AppColors.primary
                    : Colors.transparent),
            boxShadow: widget.boxShadow ??
                [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: const Offset(0, 2),
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: widget.crossAxisAlignment,
            children: [
              if (widget.leading != null) ...[
                widget.leading!,
                ContainerDevider.blankSpaceS
              ],
              Expanded(
                child: Padding(
                  padding: widget.contentPadding ?? EdgeInsets.zero,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.title != null || widget.label != null) ...[
                        Wrap(
                          spacing: 5,
                          runSpacing: 5,
                          children: [
                            if (widget.title != null &&
                                widget.title!.isNotEmpty) ...[
                              Text(
                                widget.title!,
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: AppColors.textPrimary,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                            ...widget.label ?? []
                          ],
                        ),
                      ],
                      if (widget.description != null) ...[
                        ContainerDevider.blankSpaceS,
                        Text(
                          widget.description!,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                      if (widget.child != null) ...[
                        ContainerDevider.blankSpaceM,
                        widget.child!
                      ],
                      if (widget.children != null) ...[
                        ContainerDevider.blankSpaceM,
                        Wrap(children: widget.children!)
                      ]
                    ],
                  ),
                ),
              ),
              if (widget.trailing != null) ...[widget.trailing!],
            ],
          ),
        ),
    );
  }
}
