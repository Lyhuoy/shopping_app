import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColors {
  static const Color primary = Color(0xFF217EFE);
  static const Color primaryLight = Color(0xFFE9F1FD);
   static const Color textPrimary = Color(0xFF333333);
   static const Color textSecondary = Color(0xFF656464);
   static const Color success = Color.fromRGBO(76, 185, 122, 1);
   static const Color error = Color(0xFFE82828);
   static const Color pageBackground = Color(0xFFF8F8F8);
   static const Color textFieldBackground = Color(0xFFF7F8F9);
   static Color barrierBackground = const Color(0xFF000000).withOpacity(0.5);
   static const Color greyishDisable = Color(0x159E9E9E);
   static const Color darkGrey = Color(0xFF3A3A3A);

   static const Color buttonSelected = Color(0xFFE9F1FD);
   static const Color buttonUnselected = Color(0xFFF7F7F7);
  
  
   //InvCountTrxFlag
   static const Color invCountTrxFlagPending = Color(0xFFE82828);
   static const Color invCountTrxFlagInprogress = Color(0xFF01A21F);

  // Neng
  static const Color textBoldStyle = Color.fromARGB(255, 43, 42, 50);
  static const Color textTitleCaption = Color.fromARGB(255, 50, 50, 50);
  static const Color textSubTitleF12 = Color.fromARGB(255, 164, 164, 164);

  static Color appBarColor = Colors.white;
  static Color appBarTextColor = primary;
  static Color transparent = Colors.transparent;
  static const SystemUiOverlayStyle darkSystemUiOverlayStyle = SystemUiOverlayStyle(
      // systemNavigationBarColor: Color.fromARGB(255, 189, 35, 35), // navigation bar color
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarContrastEnforced: true,
      systemStatusBarContrastEnforced: true,
      statusBarColor: Colors.transparent,
    );

    static const SystemUiOverlayStyle lightSystemUiOverlayStyle = SystemUiOverlayStyle(
      // systemNavigationBarColor: Color.fromARGB(255, 189, 35, 35), // navigation bar color
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarContrastEnforced: true,
      systemStatusBarContrastEnforced: true,
      statusBarColor: Colors.transparent,
    );
}

