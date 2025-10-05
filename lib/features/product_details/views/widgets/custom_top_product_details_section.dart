import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/features/home/models/product_model.dart';
import 'package:marketi/features/product_details/views/widgets/custom_product_details_image.dart';
import 'package:marketi/features/product_details/views/widgets/custom_product_details_rating.dart';

class CustomTopProductDetailsSection extends StatelessWidget {
  const CustomTopProductDetailsSection({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomProductDetailsImage(image: product.image),
          SizedBox(height: 12.h),
          Text(product.title, style: AppTextStyle.semiBold24),
          SizedBox(height: 13.h),
          CustomProductDetailsRating(rate: product.rating.rate,ratingCount: product.rating.count,),
          SizedBox(height: 13.h),
          Text(product.description, style: AppTextStyle.regular16),
        ],
      ),
    );
  }
}
