import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/assets_manager/assets_manager.dart';

class CustomProductDetailsImage extends StatelessWidget {
  const CustomProductDetailsImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
                  child: Image.asset(
                    width: 341.w,
                    height: 368.5341491699219.h,
                    AssetsManager.productImagePoloShirt,
                  ),
                );
  }
}