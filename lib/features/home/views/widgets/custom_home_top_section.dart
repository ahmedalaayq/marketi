import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/features/home/views/widgets/custom_home_search_field.dart';

class CustomHomeTopSection extends StatelessWidget {
  const CustomHomeTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Discover', style: AppTextStyle.semiBold32),
                SizedBox(height: 16.h),
                const CustomHomeSearchField(),
                SizedBox(height: 20.h),
              ],
            );
  }
}