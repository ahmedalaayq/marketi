import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/core/assets_manager/assets_manager.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/core/theme/light_colors.dart';

class CustomAddressCard extends StatelessWidget {
  const CustomAddressCard({super.key, this.isDefaultAddress = false});
  final bool ?isDefaultAddress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
        border: Border.all(color: LightColors.lightWhiteColor, width: 1.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            AssetsManager.addressLocationIcon,
            width: 28.w,
            height: 28.h,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6,
              children: [
                Row(
                  spacing: 6.w,
                  children: [
                    Text('Home', style: AppTextStyle.semiBold14),
                    
                                          isDefaultAddress == true ? 
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: LightColors.primaryColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: 
                      Text(
                        'Default',
                        style: AppTextStyle.medium16.copyWith(
                          fontSize: 10.sp,
                          color: LightColors.primaryColor,
                        ),
                      ),
                    ) : const SizedBox.shrink(),
                  ],
                ),
                Text(
                  '925 S Chugach St #APT 10, Alaska, US',
                  style: AppTextStyle.regular16.copyWith(
                    fontSize: 13.sp,
                    color: LightColors.greyColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
