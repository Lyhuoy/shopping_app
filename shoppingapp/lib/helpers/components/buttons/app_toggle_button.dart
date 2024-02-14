import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppToggleButton {
  Widget itemBuilder<T>({
    required T selectedItem,
    required List<T> items,
    required void Function(T, int index) onChanged,
    required Widget Function(T, int index) itemBuilder,
    required Widget Function(T, int index) selectedItemBuilder,
    Widget Function(BuildContext, int index)? separatorBuilder,
    bool scrollable = true,
    double itemSpace = 10.0,
    Widget? itemSeperator,
    Axis scrollDirection = Axis.horizontal,
    double crossSize = 45,
    EdgeInsets? padding,
  }) {
    double? itemSize = scrollable ? null : Get.width / items.length;
    return SizedBox(
      height: scrollDirection == Axis.horizontal ? crossSize:null,
      width: Get.width,
      child: ListView.separated(
        itemCount: items.length,
        padding:padding,
        scrollDirection: scrollDirection,
        physics: scrollable
            ? const BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        separatorBuilder: separatorBuilder ??
            (c, i) => SizedBox(
                  width: itemSpace,
                  height: itemSpace,
                ),
        itemBuilder: (context, index) {
          T item = items.elementAt(index);
          return InkWell(
            onTap: () => onChanged(item, index),
            child: SizedBox(
              width: scrollDirection == Axis.horizontal ? itemSize : null,
              height: scrollDirection == Axis.vertical ? itemSize : null,
              child: selectedItem == item ? selectedItemBuilder(item, index): itemBuilder(item, index),
            ),
          );
        },
      ),
    );
  }
}
