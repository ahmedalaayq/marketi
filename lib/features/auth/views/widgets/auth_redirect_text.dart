import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/core/theme/light_colors.dart';

class AuthRedirectText extends StatelessWidget {
  const AuthRedirectText({
    super.key,
    required this.question,
    required this.action,
    required this.onTap,
  });

  final String question;
  final String action;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: question, style: AppTextStyle.regular16),
            TextSpan(
              text: action,
              style: AppTextStyle.medium16.copyWith(
                color: LightColors.blackColor,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
