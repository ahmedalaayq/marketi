import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/router/app_routes.dart';
import 'package:marketi/features/home/models/product_model.dart';
import 'package:marketi/features/home/views/widgets/custom_home_product_grid_item.dart';

class CustomHomeProductSliverGrid extends StatelessWidget {
  const CustomHomeProductSliverGrid({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(bottom: 20.h),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return CustomHomeProductGridItem(
            product: products[index],
            index: index,
            onTap: () {
              GoRouter.of(context).push(AppRoutes.productDetailsView,extra: products[index]);
            },
          );
        }, childCount: products.length),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          crossAxisCount: 2,
          childAspectRatio: 0.68,
        ),
      ),
    );
  }
}
