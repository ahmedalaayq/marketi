import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketi/core/theme/light_colors.dart';

class AppTextStyle {
  static final appBarStyle = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: LightColors.blackColor,
  );

  static final semiBold32 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
  );

  static final semiBold24 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
  );
  static final semiBold16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
  static final semiBold14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );

  static final regular18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
  );
  static final regular12 = TextStyle(
    fontSize: 12.sp,
    color: LightColors.greyColor,
    fontWeight: FontWeight.w400,
  );
  static final regular16 = TextStyle(
    fontSize: 16.sp,
    color: LightColors.greyColor,
    fontWeight: FontWeight.w400,
  );
  static final regular16Black = TextStyle(
    fontSize: 16.sp,
    color: LightColors.blackColor,
    fontWeight: FontWeight.w400,
  );
  static final medium16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );
  static final medium14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.dmSans().fontFamily,
    color: Colors.white
  );
  static final medium12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );
}
