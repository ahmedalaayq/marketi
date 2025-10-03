import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/features/auth/views/widgets/auth_redirect_text.dart';
import 'package:marketi/features/auth/views/widgets/custom_sign_up_form.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.sp),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Create an Account', style: AppTextStyle.semiBold32),
                SizedBox(height: 8.h),
                Text(
                  'Let’s create your account.',
                  style: AppTextStyle.regular16,
                ),
                SizedBox(height: 24.h),
                const CustomSignUpForm(),

                SizedBox(height: 55.h),

                const Spacer(),
                AuthRedirectText(
                  question: 'Already have an account? ',
                  action: 'Log In',
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
