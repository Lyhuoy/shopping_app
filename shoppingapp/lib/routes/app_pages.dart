import 'package:shoppingapp/core.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static String init = AppRoutes.main;
  // static const init = Routes.payScreen;

  static final routes = [
    GetPage(
      name: AppRoutes.dev,
      page: () => const DevScreen(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => const HomeScreen(),
    ),
  ];
}
