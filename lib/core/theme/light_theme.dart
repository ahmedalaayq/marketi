import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/core/theme/light_colors.dart';

final ThemeData lightTheme = ThemeData(
  fontFamily: GoogleFonts.readexPro().fontFamily,
  scaffoldBackgroundColor: Colors.white,
  useMaterial3: true,
  primaryColor: LightColors.primaryColor,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.black),
    titleTextStyle: AppTextStyle.appBarStyle,
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: AppTextStyle.regular16,

    filled: true,
    fillColor: LightColors.lightWhiteColor,
    contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
    border: const OutlineInputBorder(),
    enabledBorder: _buildTextFieldBorder(),
    focusedBorder: _buildTextFieldBorder(),
    errorBorder: _buildTextFieldBorder(),
    errorStyle: AppTextStyle.regular16.copyWith(color: LightColors.redColor),
    focusedErrorBorder: _buildTextFieldBorder(),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: LightColors.primaryColor,
      foregroundColor: Colors.white,
      textStyle: AppTextStyle.medium16.copyWith(fontSize: 14.sp),
      minimumSize: Size(325.w, 50.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    selectionHandleColor: LightColors.primaryColor,
    cursorColor: LightColors.primaryColor,
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: LightColors.primaryColor,
    unselectedItemColor: LightColors.greyColor,
    unselectedLabelStyle: AppTextStyle.medium12.copyWith(height: 2.0.h),
    selectedLabelStyle: AppTextStyle.medium12.copyWith(height: 2.0.h),
    type: BottomNavigationBarType.fixed,
  ),
  splashFactory: NoSplash.splashFactory,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  hoverColor: Colors.transparent,
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: GoTransitions.fadeUpwards,
      TargetPlatform.iOS: GoTransitions.cupertino,
      TargetPlatform.macOS: GoTransitions.cupertino,
    },
  ),
);

OutlineInputBorder _buildTextFieldBorder({double? borderWidth, Color? color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.r),
    borderSide: BorderSide(
      width: borderWidth ?? 1,
      color: color ?? LightColors.lightWhiteColor,
      style: BorderStyle.solid,
    ),
  );
}
