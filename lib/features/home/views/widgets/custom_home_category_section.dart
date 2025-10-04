import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/core/theme/light_colors.dart';

class CustomHomeCategorySection extends StatefulWidget {
  const CustomHomeCategorySection({super.key});

  @override
  State<CustomHomeCategorySection> createState() =>
      _CustomHomeCategorySectionState();
}

class _CustomHomeCategorySectionState extends State<CustomHomeCategorySection> {
  int _selectedCategoryIndex = 0;
  final categories = ["T-Shirts", "Jeans", "Shoes", "Jackets", "Accessories"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final isSelected = _selectedCategoryIndex == index;
          return InkWell(
            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
            onTap: () {
              setState(() {
                _selectedCategoryIndex = index;
              });
            },
            child: AnimatedContainer(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 350),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
              decoration: BoxDecoration(
                color:
                    isSelected
                        ? LightColors.primaryColor
                        : LightColors.lightWhiteColor,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow:
                    isSelected
                        ? [
                          BoxShadow(
                            color: LightColors.primaryColor.withOpacity(0.3),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ]
                        : [],
              ),
              child: Text(
                categories[index],
                style: AppTextStyle.medium16.copyWith(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 16.w),
        itemCount: categories.length,
      ),
    );
  }
}
