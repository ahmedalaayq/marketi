import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/assets_manager/assets_manager.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/core/theme/light_colors.dart';
import 'package:marketi/features/home/models/product_model.dart';

class CustomHomeProductGridItem extends StatelessWidget {
  const CustomHomeProductGridItem({
    super.key,
    required this.index,
    required this.onTap,
    required this.product,
  });
  final int index;
  final VoidCallback onTap;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 174.h,
            decoration:
                product.image.isEmpty
                    ? BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    )
                    : null,
            child: Hero(
              tag: 'productImage/${product.image}',
              child: CachedNetworkImage(
                
                errorWidget: (context, url, error) {
                  return Image.asset(
                    index.isEven
                        ? AssetsManager.productImagePoloShirt
                        : AssetsManager.productImageShoes,
                  );
                },
                imageUrl: product.image,
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          product.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.semiBold16,
        ),
        SizedBox(height: 4.h),
        Text(
          '${product.price}\$',
          style: AppTextStyle.semiBold16.copyWith(
            color: LightColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
