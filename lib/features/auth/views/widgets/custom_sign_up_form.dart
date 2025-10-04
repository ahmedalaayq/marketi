import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/light_colors.dart';
import 'package:marketi/features/auth/views/widgets/custom_button.dart';
import 'package:marketi/features/auth/views/widgets/custom_login_input_field.dart';

class CustomSignUpForm extends StatefulWidget {
  const CustomSignUpForm({super.key});

  @override
  State<CustomSignUpForm> createState() => _CustomSignUpFormState();
}

class _CustomSignUpFormState extends State<CustomSignUpForm> {
  late GlobalKey<FormState> _formKey;
  late AutovalidateMode _autovalidateMode;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _autovalidateMode = AutovalidateMode.disabled;
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _formKey.currentState?.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          CustomInputField(
            inputLabel: 'Full Name',
            hintText: 'Enter your full name',
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'field full name is required';
              } else if (value!.length < 15) {
                return 'length must be greater than 15';
              }
              return null;
            },
          ),
          SizedBox(height: 16.h),

          CustomInputField(
            inputLabel: 'Email Address',
            hintText: 'Enter your email address',
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
            controller: _passwordController,
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
          SizedBox(height: 16.h),

          CustomInputField(
            controller: _confirmPasswordController,
            validator: (String? value) {
              if (value?.trim().isEmpty ?? false) {
                return 'field password is required';
              } else if (value!.length < 8) {
                return 'password can\'t be less than 8 character';
              } else if (_confirmPasswordController.text !=
                  _passwordController.text) {
                return 'password not match';
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
              btnText: 'Create Account',
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
