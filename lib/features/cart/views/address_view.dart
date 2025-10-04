import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/features/auth/views/widgets/custom_button.dart';
import 'package:marketi/features/cart/views/widgets/custom_address_card.dart';
import 'package:marketi/features/cart/views/widgets/custom_cart_appbar.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Address'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 16.h),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Saved Address', style: AppTextStyle.semiBold16),
                  SizedBox(height: 16.h),

                  //todo: --- Address Card ---
                  Column(
                    spacing: 12.h,
                    children: [
                      ...List.generate(5, (int index) {
                        return CustomAddressCard(
                          isDefaultAddress: index == 0 ? true : false,
                        );
                      }),
                    ],
                  ),

                  // --- Add Address Button ---
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 24.w),
        child: CustomButton(btnText: 'Add New Address', onPressed: () {}),
      ),
    );
  }
}
