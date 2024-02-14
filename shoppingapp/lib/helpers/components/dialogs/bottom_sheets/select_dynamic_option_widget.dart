import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/core.dart';


class SelectDynamicOptionWidget<T> extends StatefulWidget {
  const SelectDynamicOptionWidget({
    Key? key,
    this.selectedItem,
    required this.title,
    required this.items,
    required this.onSelectedItem,
    required this.builder,
    this.separatorBuilder,
    this.closeOnSelect = false,
    this.selectedItemDecoration,
    this.iconColor,
  }) : super(key: key);

  final String title;
  final T? selectedItem;
  final List<T> items;
  final OnSelectedCBottomSheet<T> onSelectedItem;
  final CBottomSheetChild<T> builder;
  final Widget? separatorBuilder;
  final bool closeOnSelect;
  final Decoration? selectedItemDecoration;
  final Color? iconColor;

  @override
  State<SelectDynamicOptionWidget<T>> createState() =>
      _SelectDynamicOptionWidgetState<T>();
}

class _SelectDynamicOptionWidgetState<T>
    extends State<SelectDynamicOptionWidget<T>> {
  final _seletedItemIndex = 0.obs;
  int get seletedItemIndex => _seletedItemIndex.value;
  set seletedItemIndex(int value) => _seletedItemIndex.value = value;

  @override
  void initState() {
    super.initState();
    if (widget.selectedItem != null && widget.items.isNotEmpty) {
      seletedItemIndex = widget.items.indexOf(widget.selectedItem as T);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 60),
                Text(
                  widget.title,
                  style:
                      AppTextStyle.title,
                ),
                const CloseButton(color: Colors.grey),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            constraints: BoxConstraints(maxHeight: Get.height - 120),
            child: SafeArea(
              top: false,
              child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                itemCount: widget.items.length,
                separatorBuilder: (context, index) =>
                    widget.separatorBuilder ?? const SizedBox(height: 10),
                itemBuilder: (context, index) => InkWell(
                  splashColor: AppColors.primary.withOpacity(.9),
                  highlightColor: AppColors.primary.withOpacity(.4),
                  overlayColor: MaterialStateProperty.all(
                      AppColors.primary.withOpacity(.9)),
                  onTap: () {
                    seletedItemIndex = index;
                    widget.onSelectedItem(index, widget.items.elementAt(index));
                    if (widget.closeOnSelect) Get.back();
                  },
                  child: Obx(
                    () => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: seletedItemIndex == index &&
                              widget.selectedItem != null
                          ? widget.selectedItemDecoration
                          : null,
                      child: Row(
                        children: [
                          Expanded(
                            child: widget.builder(
                              index,
                              widget.items.elementAt(index),
                            ),
                          ),
                          Visibility(
                            visible: seletedItemIndex == index &&
                                widget.selectedItem != null,
                            child: Icon(
                              Icons.check,
                              color: widget.iconColor ?? AppColors.primary,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
