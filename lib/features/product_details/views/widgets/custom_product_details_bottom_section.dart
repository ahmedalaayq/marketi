import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/core/theme/light_colors.dart';
import 'package:marketi/core/widgets/custom_btn_icon.dart';
import 'package:marketi/features/cart/cubit/cart_cubit.dart';
import 'package:marketi/features/cart/cubit/cart_state.dart';
import 'package:marketi/features/home/models/product_model.dart';

class CustomProductDetailsBottomSection extends StatelessWidget {
  const CustomProductDetailsBottomSection({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.h),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: LightColors.lightWhiteColor)),
      ),
      width: 390.w,
      height: 105.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Price', style: AppTextStyle.regular16),
                Text('\$${productModel.price}', style: AppTextStyle.semiBold24),
              ],
            ),
            SizedBox(width: 16.w),
            Flexible(
              child: BlocConsumer<CartCubit, CartState>(
                listener: (context, state) {
                  if (state is AddingToCartSuccessState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: LightColors.primaryColor,
                        content: Row(
                          children: [
                            Expanded(child: Text('Product Added Successfully')),
                            Icon(Icons.check_circle, color: Colors.white),
                          ],
                        ),
                      ),
                    );
                  } else if (state is AddingToCartFailureState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.redAccent,
                        content: Text(state.errorMessage),
                      ),
                    );
                  }
                },

                builder: (context, state) {
                  final isLoading = state is AddingToCartLoadingState;
                  return CustomBtnIcon(
                    isLoading: isLoading,
                    icon: Icons.shopping_cart,
                    btnText: 'Add to Cart',
                    onPressed:
                        isLoading
                            ? () {}
                            : () {
                              context.read<CartCubit>().addToCart(
                                date: DateTime.now().toString(),
                                quantity: 1,
                                product: productModel,
                              );
                            },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
