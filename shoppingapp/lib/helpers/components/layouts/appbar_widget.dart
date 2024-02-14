import 'package:shoppingapp/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppAppBarWidget {
  static PreferredSizeWidget normal({
    String title = "",
    Widget? titleWidget,
    List<Widget>? actions,
    PreferredSizeWidget? bottom,
    double? toolbarHeight,
    Color? titleColor,
    Color? backgroundColor,
    Widget? leadingWidget,
    SystemUiOverlayStyle systemOverlayStyle = AppColors.darkSystemUiOverlayStyle,
  }) {
    return AppBar(
      systemOverlayStyle: systemOverlayStyle,
      title: titleWidget ??
          Text(
            title,
            style: TextStyle(
                color: titleColor ?? AppColors.appBarTextColor,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
      actions: actions,
      centerTitle: false,
      toolbarHeight: toolbarHeight,
      backgroundColor: backgroundColor ?? Colors.white,
      leading: leadingWidget,
      iconTheme: IconThemeData(color: AppColors.appBarTextColor, size: 20),
      bottom: bottom,
    );
  }

  static SliverAppBar sliver({
    String title = "",
    Widget? titleWidget,
    List<Widget>? actions,
    double? toolbarHeight,
    double? expandedHeight,
    Color? titleColor,
    Color? backgroundColor,
    Widget? leadingWidget,
  }) {

    return SliverAppBar.medium(
      systemOverlayStyle: AppColors.darkSystemUiOverlayStyle,
      toolbarHeight: toolbarHeight?? 64.0,
      collapsedHeight: toolbarHeight,
      expandedHeight: expandedHeight,
      title: titleWidget ??
           Text(
            title,
            style: TextStyle(
              color: titleColor ?? AppColors.appBarTextColor,
              fontSize: 18,
              height: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
      actions: actions,
      automaticallyImplyLeading: true,
      floating: true,
      pinned: true,
      centerTitle: false,
      backgroundColor: backgroundColor ?? Colors.white,
      leading: leadingWidget ?? InkWell(
        onTap: Get.back,
        child: const Icon(Icons.chevron_left,),
      ),
      iconTheme: IconThemeData(color: AppColors.appBarTextColor, size: 27),
    );
  }
}
