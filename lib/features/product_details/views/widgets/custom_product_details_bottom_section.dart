import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/core/theme/light_colors.dart';
import 'package:marketi/core/widgets/custom_btn_icon.dart';

class CustomProductDetailsBottomSection extends StatelessWidget {
  const CustomProductDetailsBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.only(top:  16.h),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: LightColors.lightWhiteColor,
                  )
                ),

              ),
              width: 390.w,
              height: 105.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Price', style: AppTextStyle.regular16),
                        Text('\$1,190', style: AppTextStyle.semiBold24),
                      ],
                    ),
                    SizedBox(width: 16.w),
                    Flexible(
                      child: CustomBtnIcon(icon: Icons.shopping_cart, btnText: 'Add to Cart', onPressed: (){}),
                    ),
                  ],
                ),
              ),
            );
  }
}