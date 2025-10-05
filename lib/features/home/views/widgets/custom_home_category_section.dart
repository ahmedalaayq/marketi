import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/core/theme/light_colors.dart';
import 'package:marketi/features/home/models/category_model.dart';
class CustomHomeCategorySection extends StatefulWidget {
  const CustomHomeCategorySection({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  final List<CategoryModel> categories;
  final Function(String categoryName) onCategorySelected; 

  @override
  State<CustomHomeCategorySection> createState() =>
      _CustomHomeCategorySectionState();
}

class _CustomHomeCategorySectionState extends State<CustomHomeCategorySection> {
  int _selectedCategoryIndex = 0;

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
              widget.onCategorySelected(widget.categories[index].categoryName);
            },
            child: AnimatedContainer(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 350),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
              decoration: BoxDecoration(
                color: isSelected
                    ? LightColors.primaryColor
                    : LightColors.lightWhiteColor,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: LightColors.primaryColor.withValues(alpha: 0.3),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ]
                    : [],
              ),
              child: Text(
                widget.categories[index].categoryName,
                style: AppTextStyle.medium16.copyWith(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 16.w),
        itemCount: widget.categories.length,
      ),
    );
  }
}
