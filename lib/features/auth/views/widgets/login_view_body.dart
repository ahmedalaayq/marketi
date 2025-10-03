import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/router/app_routes.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/features/auth/views/widgets/auth_redirect_text.dart';
import 'package:marketi/features/auth/views/widgets/custom_login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

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
                Text('Login to your account', style: AppTextStyle.semiBold32),
                SizedBox(height: 8.h),
                Text(
                  'It’s great to see you again.',
                  style: AppTextStyle.regular16,
                ),
                SizedBox(height: 24.h),
                const CustomLoginForm(),

                SizedBox(height: 55.h),

                const Spacer(),
                AuthRedirectText(
                  question: 'Don\'t have an account? ',
                  action: 'Join',
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.signUpView);
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
