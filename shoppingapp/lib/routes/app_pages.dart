import 'package:shoppingapp/core.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/views/onboardings/onboarding_screen.dart';
part 'app_routes.dart';

class AppPages {
  static String init = AppRoutes.onboarding;
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
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
    ),
  ];
}
