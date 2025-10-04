import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/core/theme/light_colors.dart';
import 'package:marketi/core/widgets/custom_btn_icon.dart';

import 'custom_cart_appbar.dart';
import 'custom_cart_item.dart';


class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomCartAppbar(title: 'My Cart',),
                  ...List.generate(3, (int index) {
                    return const CustomShoppingCartItem();
                  }),
                  SizedBox(height: 28.h),
                ],
              ),
            ),

            // Totals Section
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCustomCardBill(
                    billingTitle: 'Sub-total',
                    price: '\$ 5,870',
                  ),
                  _buildCustomCardBill(
                    billingTitle: 'VAT (%)',
                    price: '\$ 0.00',
                  ),
                  _buildCustomCardBill(
                    billingTitle: 'Shipping fee',
                    price: '\$ 80',
                  ),

                  const Divider(),
                  _buildCustomCardBill(
                    billingTitle: 'Total',
                    price: '\$ 5,950',
                    isTotal: true,
                  ),

                  SizedBox(height: 100.h), 
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: CustomBtnIcon(
          icon: Icons.arrow_forward_outlined,
          btnText: 'Go To Checkout',
          onPressed: () {},
          iconAlignment: IconAlignment.end,
        ),
      ),
    );
  }
}


  Row _buildCustomCardBill({
    required String billingTitle,
    required String price,
    bool isTotal = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          billingTitle,
          style:
              isTotal
                  ? AppTextStyle.regular16.copyWith(
                    color: LightColors.blackColor,
                  )
                  : AppTextStyle.regular16,
        ),
        Text(price, style: AppTextStyle.medium16),
      ],
    );
  }
