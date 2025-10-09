import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/core/theme/light_colors.dart';
class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: LightColors.redColor,
                        size: 60.sp,
                      ),
                      SizedBox(height: 15.sp),
                      Text(
                        'An error occurred while fetching products.',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.semiBold16.copyWith(
                          color: LightColors.redColor,
                        ),
                      ),
                      SizedBox(height: 15.sp),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Error Details'),
                                  content: Text(
                                    'There was an issue fetching the products. Please check your connection or try again later.',
                                    style: AppTextStyle.medium16,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed:
                                          () => GoRouter.of(context).pop(),
                                      child: const Text('Close'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.info_outline),
                          label: const Text('Show Details'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: LightColors.primaryColor,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  );
  }
}