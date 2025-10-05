import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/core/theme/light_colors.dart';

class CustomProductDetailsRating extends StatelessWidget {
  const CustomProductDetailsRating({super.key, required this.rate, required this.ratingCount});
  final num rate;
  final int ratingCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: LightColors.starColor,
          size: 18.sp,
        ),
        SizedBox(height: 6.w),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '$rate/5',
                style: AppTextStyle.medium16.copyWith(
                  color: LightColors.blackColor,
                  decoration: TextDecoration.underline,
                  decorationColor: LightColors.blackColor,
                ),
              ),
              TextSpan(
                text: ' ($ratingCount reviews)',
                style: AppTextStyle.medium16.copyWith(
                  color: LightColors.greyColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
