import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marketi/core/assets_manager/assets_manager.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/core/theme/light_colors.dart';
import 'package:marketi/features/cart/views/widgets/custom_cart_appbar.dart';


class CustomShoppingCartItem extends StatelessWidget {
  const CustomShoppingCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
  
          SizedBox(height: 20.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 15.h),
            decoration: BoxDecoration(
              border: Border.all(
                color: LightColors.lightWhiteColor,
                width: 1.w,
              ),
              color: LightColors.lightWhiteColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    color: Colors.grey.shade400,
                    fit: BoxFit.cover,
                    AssetsManager.productImagePoloShirt,
                    height: 79.h,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    spacing: 2,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Regular Fit Slogan',
                            style: AppTextStyle.semiBold16,
                          ),
                          const Spacer(),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.solidTrashCan,
                              color: LightColors.redColor,
                              size: 16.sp,
                            ),
                          ),
                        ],
                      ),

                      Text('Size L', style: AppTextStyle.regular12),
                      SizedBox(width: 18.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$ 1,190', style: AppTextStyle.semiBold14),
                          Row(
                            spacing: 9,
                            children: [
                              IconButton.filled(
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  minimumSize: Size(
                                    15.75221061706543.w,
                                    15.366655349731445.h,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: const Color(0xFFCCCCCC),
                                      width: 0.64.w,
                                    ),
                                    borderRadius: BorderRadius.circular(3.r),
                                  ),
                                ),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.remove,
                                  color: LightColors.blackColor,
                                  size: 23.sp,
                                ),
                              ),
                              Text('2', style: AppTextStyle.medium16),

                              IconButton.filled(
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  minimumSize: Size(
                                    23.75221061706543.w,
                                    22.366655349731445.h,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: const Color(0xFFCCCCCC),
                                      width: 0.64.w,
                                    ),
                                    borderRadius: BorderRadius.circular(3.r),
                                  ),
                                ),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add,
                                  color: LightColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
  }
}