import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/light_colors.dart';
import 'package:marketi/features/auth/views/widgets/custom_button.dart';
import 'package:marketi/features/auth/views/widgets/custom_login_input_field.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  late GlobalKey<FormState> _formKey;
  late AutovalidateMode _autovalidateMode;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _autovalidateMode = AutovalidateMode.disabled;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          CustomInputField(
            inputLabel: 'Email Address',
            hintText: 'Enter your email Address',
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'field email is required';
              }
              final RegExp emailRegExp = RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );

              if (!emailRegExp.hasMatch(value!)) {
                return "enter a valid email address";
              }
              return null;
            },
          ),
          SizedBox(height: 16.h),
          CustomInputField(
            validator: (String? value) {
              if (value?.trim().isEmpty ?? false) {
                return 'field password is required';
              } else if (value!.length < 8) {
                return 'password can\'t be less than 8 character';
              }
              return null;
            },
            inputLabel: 'Password',
            hintText: 'Enter your password',
            suffixIcon: Icons.remove_red_eye,
          ),

          SizedBox(height: 51.h),
          Center(
            child: CustomButton(
              btnText: 'Sign in',
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: LightColors.primaryColor,
                      content: Row(
                        children: [
                          Expanded(child: Text('Validator Success')),
                          Icon(Icons.error_outline, color: Colors.white),
                        ],
                      ),
                    ),
                  );
                } else {
                  setState(() {
                    _autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
