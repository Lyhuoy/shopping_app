import 'package:shoppingapp/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // ignore: unused_field
  final _controller = Get.put(HomeScreenController());
  final _mainKey = GlobalKey<ScaffoldState>();
  bool smallScreen = Get.height < 600;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.pageBackground,
        key: _mainKey,
        drawer: HomeScreenDrawer(),
        drawerEnableOpenDragGesture: false,
        appBar: AppBar(
          leading: InkWell(
            onTap: () => _mainKey.currentState?.openDrawer(),
            child: const Icon(
              Icons.menu,
              size: 25,
            ),
          ),
          titleSpacing: 0,
          title: smallScreen ? _appTitle : null,
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (!smallScreen)
                Container(
                  padding:
                      const EdgeInsets.only(left: 15, bottom: 15, right: 15),
                  color: Colors.white,
                  child: _appTitle,
                ),
              Expanded(
                child: SmartRefresher(
                  controller: _controller.homeRefreshController,
                  onRefresh: _controller.onHomeRefresh,
                ),
              ),
            ],
        
        ));
  }

  Widget get _appTitle => RichText(
        text: TextSpan(
            style: TextStyle(
              color: AppColors.appBarTextColor,
              fontWeight: FontWeight.w300,
              fontSize: 21,
            ),
            children: const [
              TextSpan(text: "Wellcome "),
              TextSpan(
                  text: "Kunthy",
                  style: TextStyle(fontWeight: FontWeight.w500))
            ]),
      );
}
