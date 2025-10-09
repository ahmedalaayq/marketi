import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/assets_manager/assets_manager.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/core/theme/light_colors.dart';
import 'package:marketi/core/utils/service_locator.dart';
import 'package:marketi/features/auth/repo/auth_repo.dart';
import 'package:marketi/features/auth/views/widgets/custom_button.dart';

class CustomDialogItem extends StatelessWidget {
  const CustomDialogItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(AssetsManager.accountWarningIcon),
        SizedBox(height: 12.h),
        Text(
          'Logout?',
          style: AppTextStyle.semiBold16.copyWith(fontSize: 20.sp),
        ),
        SizedBox(height: 8.h),
        Text('Are you sure you want to logout?', style: AppTextStyle.regular16),
        SizedBox(height: 24.h),
        CustomButton(
          btnText: 'Yes, Logout',
          onPressed: () {
            di<AuthRepo>().logout(context);
          },
          backgroundColor: LightColors.redColor,
          btnTextStyle: AppTextStyle.medium16,
        ),
        SizedBox(height: 12.h),
        CustomButton(
          btnText: 'No, Cancel',
          onPressed: () {
            context.pop();
          },
          backgroundColor: LightColors.starColor,
          btnTextStyle: AppTextStyle.medium16.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
