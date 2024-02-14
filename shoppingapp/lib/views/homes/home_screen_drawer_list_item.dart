
import 'package:shoppingapp/core.dart';
import 'package:flutter/material.dart';

class HomeScreenDrawerListItem extends StatefulWidget {
  const HomeScreenDrawerListItem({
    super.key,
    required this.label,
    this.onTap,
    this.child,
    this.leading,
    this.trialing,
    this.padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    this.margin,
    this.labelColor,
  });

  final void Function()? onTap;
  final String label;
  final Widget? child;
  final Widget? leading;
  final Widget? trialing;
  final EdgeInsets padding;
  final EdgeInsets? margin;
  final Color? labelColor;

  @override
  State<HomeScreenDrawerListItem> createState() =>
      _HomeScreenDrawerListItemState();
}

class _HomeScreenDrawerListItemState extends State<HomeScreenDrawerListItem> {
  bool onFocus = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: InkWell(
        focusColor: Colors.transparent,
        onFocusChange: (b) {
          setState(() {
            onFocus = b;
          });
        },
        onTap: widget.onTap,
        child:Container(
            padding: widget.padding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizeStyle.buttonRound),
              color: Colors.white
                  .withOpacity(widget.onTap != null && onFocus ? 0.5 : 1),
              border: Border.all(
                color: widget.onTap != null && onFocus
                    ? AppColors.primary
                    : Colors.transparent,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, 2),
                  blurRadius: 8,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              children: [
                if (widget.leading != null) ...[
                  widget.leading!,
                  ContainerDevider.blankSpaceL
                ],
                Expanded(
                  child: widget.child ??
                      Text(
                        widget.label,
                        style: TextStyle(color: widget.labelColor),
                      ),
                ),
                if (widget.trialing != null) ...[
                  ContainerDevider.blankSpaceL,
                  widget.trialing!
                ] else ...[
                  const Icon(
                    Icons.chevron_right_rounded,
                    size: 18,
                  )
                ],
              ],
            ),
          ),
        ),
    );
  }
}
