import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    hintStyle:AppTextStyle.regular16 ,
    filled: true,
    fillColor: LightColors.lightWhiteColor,
    contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
    border: const OutlineInputBorder(),
    enabledBorder:_buildTextFieldBorder() ,
    focusedBorder: _buildTextFieldBorder(),
    errorBorder: _buildTextFieldBorder(),
    focusedErrorBorder:_buildTextFieldBorder() 
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: LightColors.primaryColor,
      foregroundColor: Colors.white,
      textStyle: AppTextStyle.medium16.copyWith(fontSize: 14.sp),
      padding: EdgeInsets.symmetric(horizontal: 153.w,vertical: 15.h),
      fixedSize: Size(325.w, 50.h),
    )
  )
);

OutlineInputBorder _buildTextFieldBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.r),
    borderSide: BorderSide(
      width: 1.w,
      color: LightColors.lightWhiteColor,
      style: BorderStyle.solid,
    )
  );
}
