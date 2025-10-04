import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/assets_manager/assets_manager.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/core/theme/light_colors.dart';

class CustomHomeProductGridItem extends StatelessWidget {
  const CustomHomeProductGridItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 174.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                index.isEven
                    ? AssetsManager.productImagePoloShirt
                    : AssetsManager.productImageShoes,
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          index.isEven ? 'Fit Polo T Shirt' : 'Shoes',
          style: AppTextStyle.semiBold16,
        ),
        SizedBox(height: 4.h),
        Text(
          index.isEven ? '1190\$' : '1100\$',
          style: AppTextStyle.semiBold16.copyWith(
            color: LightColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
