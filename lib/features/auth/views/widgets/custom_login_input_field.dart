import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/core/widgets/custom_text_form_field.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    required this.inputLabel,
    required this.hintText,
    this.suffixIcon, this.obscureText  = false, required this.validator,
  });
  final String inputLabel;
  final String hintText;
  final IconData? suffixIcon;
  final bool obscureText;
  final FormFieldValidator<String?> validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          inputLabel,
          style: AppTextStyle.medium16.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4.h),

        CustomTextFormField(
          
          validator: validator,
          hintText: hintText, suffixIcon: suffixIcon,obscureText: obscureText,),
      ],
    );
  }
}
