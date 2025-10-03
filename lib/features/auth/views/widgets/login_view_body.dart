import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/core/theme/light_colors.dart';
import 'package:marketi/features/auth/views/widgets/custom_form.dart';
import 'package:marketi/features/auth/views/widgets/custom_login_input_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.sp),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Login to your account', style: AppTextStyle.semiBold32),
            SizedBox(height: 8.h),
            Text('It’s great to see you again.', style: AppTextStyle.regular16),
            SizedBox(height: 24.h),
            const CustomForm(),
            
            SizedBox(height: 55.h),
            
            SizedBox(height: 300.h),
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Don’t have an account? ',
                      style: AppTextStyle.regular16,
                    ),
                    TextSpan(
                      text: 'Join',
                      style: AppTextStyle.medium16.copyWith(
                        color: LightColors.blackColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
