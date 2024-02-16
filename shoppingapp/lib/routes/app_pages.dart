import 'package:shoppingapp/core.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/views/authentication/forget_password_screen.dart';
import 'package:shoppingapp/views/authentication/login_screen.dart';
import 'package:shoppingapp/views/authentication/new_password_screen.dart';
import 'package:shoppingapp/views/authentication/sign_up_screen.dart';
import 'package:shoppingapp/views/authentication/start_screen.dart';
import 'package:shoppingapp/views/authentication/verification_code_screen.dart';
import 'package:shoppingapp/views/homes/home_welcome_screen.dart';
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
    GetPage(
      name: AppRoutes.start,
      page: () => const StartScreen(),
    ),
    GetPage(
      name: AppRoutes.authLogin,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.authRegister,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: AppRoutes.forgetPassword,
      page: () => const ForgetPasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.homeWelcome,
      page: () => const HomeWelcomeScreen(),
    ),
    GetPage(
      name: AppRoutes.verificationCode,
      page: () => const VerificationCodeScreen(),
    ),
    GetPage(
      name: AppRoutes.newPassword,
      page: () => NewPasswordScreen(),
    ),
  ];
}
