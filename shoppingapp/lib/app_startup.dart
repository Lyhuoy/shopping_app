import 'package:shoppingapp/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppStartup extends StatelessWidget {
  const AppStartup({super.key});

  @override
  Widget build(BuildContext context) {
    Locale current = const Locale('en', 'US'); // Make default language
    return GetMaterialApp(
      translationsKeys: LocalizeApp.languagesCode,
      locale: current,
      fallbackLocale: current,
      title: 'Flutter Sample',
      theme: ThemeData(
        useMaterial3: false,
        dialogTheme: const DialogTheme(
          titleTextStyle: TextStyle(fontFamily: AppFonts.outletFamily),
        ),
        textTheme:const TextTheme(
          titleLarge:TextStyle(fontFamily: AppFonts.outletFamily),
          titleMedium:TextStyle(fontFamily: AppFonts.outletFamily),
          titleSmall:TextStyle(fontFamily: AppFonts.outletFamily),
          bodyLarge:TextStyle(fontFamily: AppFonts.outletFamily),
          bodyMedium:TextStyle(fontFamily: AppFonts.outletFamily),
          bodySmall:TextStyle(fontFamily: AppFonts.outletFamily),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(color: Color.fromARGB(115, 113, 107, 107)),
          labelStyle: const TextStyle(color: AppColors.primary),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizeStyle.defaultRoundSm),
            borderSide: const BorderSide(color: AppColors.primary),
          ),
          contentPadding: const EdgeInsets.all(15),
          iconColor: Colors.black,
          prefixIconColor: AppColors.primary,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizeStyle.defaultRoundSm),
            borderSide: const BorderSide(color: AppColors.greyishDisable),
          ),
          focusColor: AppColors.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.all(Colors.white.withOpacity(0.2)))),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                    AppColors.primary.withOpacity(0.2)))),
        appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: AppColors.appBarColor,
            toolbarHeight: 50,
            centerTitle: false,
            titleTextStyle: TextStyle(
                color: AppColors.appBarTextColor,
                fontSize: 15,
                fontWeight: FontWeight.bold)),
        primaryColor: AppColors.primary,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.primary,
          onPrimary: AppColors.primary,
          secondary: AppColors.primary,
          onSecondary: AppColors.primary,
          error: AppColors.error,
          onError: AppColors.error,
          background: Colors.white,
          onBackground: Colors.white,
          surface: Colors.white,
          onSurface: Colors.white,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: AppFonts.outletFamily,
      ),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      transitionDuration: const Duration(milliseconds: 230),
      initialRoute: AppPages.init,
      getPages: AppPages.routes,
    );
  }
}
