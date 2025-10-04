import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/features/product_details/views/widgets/custom_product_details_image.dart';
import 'package:marketi/features/product_details/views/widgets/custom_product_details_rating.dart';

class CustomTopProductDetailsSection extends StatelessWidget {
  const CustomTopProductDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomProductDetailsImage(),
                SizedBox(height: 12.h),
                Text('Fit Polo T Shirt', style: AppTextStyle.semiBold24),
                SizedBox(height: 13.h),
                const CustomProductDetailsRating(),
                SizedBox(height: 13.h),
                Text(
                  'Blue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of Them',
                  style: AppTextStyle.regular16,
                ),
              ],
            ),
          );
  }
}