import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/core/theme/light_colors.dart';

class CustomBtnIcon extends StatelessWidget {
  const CustomBtnIcon({
    super.key,
    required this.icon,
    required this.btnText,
    required this.onPressed,
    this.iconAlignment = IconAlignment.start, this.isLoading = false,
  });
  final IconData icon;
  final String btnText;
  final VoidCallback onPressed;
  final IconAlignment? iconAlignment;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        iconAlignment: iconAlignment,
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 40.w),
      ),
      icon: 
      isLoading ? null :
      Icon(icon, size: 24.sp),

      onPressed: onPressed,
      label: 
      isLoading == true? SizedBox(
        width: 20.sp,
        height: 20.sp,
        child: const Center(child: CircularProgressIndicator(color: LightColors.lightWhiteColor,))) :
      Text(
        textAlign: TextAlign.center,
        btnText,
        style: AppTextStyle.medium16,
      ),
    );
  }
}
