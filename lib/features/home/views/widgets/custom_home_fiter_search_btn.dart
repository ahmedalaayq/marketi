import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/light_colors.dart';

class CustomHomeFiterSearchBtn extends StatelessWidget {
  const CustomHomeFiterSearchBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                height: 48.h,
                width: 48.h,
                decoration: BoxDecoration(
                  color: LightColors.primaryColor,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Icon(Icons.tune, color: Colors.white, size: 24.sp),
              );
  }
}