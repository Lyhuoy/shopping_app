import 'package:shoppingapp/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef OnSelected = Function(dynamic item);

class ListDialog extends StatelessWidget {
  const ListDialog({
    Key? key,
    required this.title,
    required this.onSelected,
    required this.items,
  }) : super(key: key);

  final String title;
  final OnSelected onSelected;
  final List<LanguageModel> items;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        height: 210,
        padding: const EdgeInsets.only(left: 20, right: 20),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSizeStyle.defaultRoundLg),
              topRight: Radius.circular(AppSizeStyle.defaultRoundLg)),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, top: 15, right: 20, bottom: 10),
              child: Text(
                title,
                style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 17,
                    decorationColor: Colors.transparent,
                    decoration: TextDecoration.none,
                    fontFamily: AppFonts.outletFamily,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () => {onSelected(items[index])},
                          child: SizedBox(
                              height: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    items[index].imagePng,
                                    fit: BoxFit.fitHeight,
                                    height: 30,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      items[index].name,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          color: AppColors.textPrimary,
                                          decoration: TextDecoration.none,
                                          fontSize: 17,
                                          fontFamily: AppFonts.outletFamily,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  if (items.elementAt(index).isSelected) ...[
                                    const Icon(Icons.check,
                                        color: AppColors.primary)
                                  ]
                                ],
                              )));
                    }))
          ],
        ));
  }
}
