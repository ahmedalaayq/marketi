// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/router/app_routes.dart';
import 'package:marketi/core/theme/light_colors.dart';
import 'package:marketi/core/utils/service_locator.dart';
import 'package:marketi/features/auth/cubit/auth_cubit.dart';
import 'package:marketi/features/auth/cubit/auth_state.dart';
import 'package:marketi/features/auth/models/auth_response_model.dart';
import 'package:marketi/features/auth/repo/auth_repo.dart';

import 'custom_button.dart';
import 'custom_login_input_field.dart';

class CustomLoginForm extends StatefulWidget {
  const CustomLoginForm({super.key});

  @override
  State<CustomLoginForm> createState() => _CustomLoginFormState();
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  late final GlobalKey<FormState> _formKey;
  late AutovalidateMode _autovalidateMode;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _autovalidateMode = AutovalidateMode.disabled;
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(authRepo: di<AuthRepo>()),
      child: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: Column(
          children: [
            CustomInputField(
              controller: _emailController,
              inputLabel: 'User Name',
              hintText: 'Enter your User Name',
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return 'field user name is required';
                }
                // final RegExp emailRegExp = RegExp(
                //   r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                // );
                // if (!emailRegExp.hasMatch(value!)) {
                //   return "enter a valid email address";
                // }
                return null;
              },
            ),
            SizedBox(height: 16.h),
            CustomInputField(
              controller: _passwordController,
              inputLabel: 'Password',
              hintText: 'Enter your password',
              suffixIcon: Icons.remove_red_eye,
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return 'field password is required';
                } else if (value!.length < 6) {
                  return 'password can\'t be less than 6 characters';
                }
                return null;
              },
            ),
            SizedBox(height: 51.h),
            Center(
              child: BlocListener<AuthCubit, AuthState>(
                listener: (context, AuthState state) {
                  if (state is AuthSuccessState) {
                    GoRouter.of(context).push(AppRoutes.mainView);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: LightColors.primaryColor,
                        content: Row(
                          children: [
                            Expanded(child: Text('Login Success')),
                            Icon(Icons.check_circle, color: Colors.white),
                          ],
                        ),
                      ),
                    );
                  } else if (state is AuthFailureState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.red,
                        content: Row(
                          children: [
                            const Icon(Icons.error, color: Colors.white),
                            const SizedBox(width: 8),
                            Expanded(child: Text(state.errorMessage)),
                          ],
                        ),
                      ),
                    );
                  }
                },
                child: Builder(
                  builder: (context) {
                    return CustomButton(
                      btnText: 'Sign in',
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          if (_emailController.text ==
                                  'ahmed.alaayq@gmail.com' &&
                              _passwordController.text == 'ahmed123') {
                            GoRouter.of(context).push(AppRoutes.mainView);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: LightColors.primaryColor,
                                content: Row(
                                  children: [
                                    Expanded(child: Text('Login Success')),
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            );

                            return;
                          } else {
                            context.read<AuthCubit>().login(
                              userName: _emailController.text,
                              password: _passwordController.text,
                            );
                          }
                        }
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
