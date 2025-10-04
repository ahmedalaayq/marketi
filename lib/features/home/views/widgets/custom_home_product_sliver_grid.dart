import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/features/home/views/widgets/custom_home_product_grid_item.dart';

class CustomHomeProductSliverGrid extends StatelessWidget {
  const CustomHomeProductSliverGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(bottom: 20.h),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return CustomHomeProductGridItem(index: index);
        }, childCount: 10),
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
