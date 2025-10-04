import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/core/theme/light_colors.dart';
import 'package:marketi/features/home/views/widgets/custom_home_fiter_search_btn.dart';

class CustomHomeSearchField extends StatelessWidget {
  const CustomHomeSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            decoration: InputDecoration(
              hintText: 'Search for clothes...',
              hintStyle: AppTextStyle.regular16.copyWith(color: Colors.grey),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 14.h,
              ),
              prefixIcon: Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 18.sp,
                color: LightColors.lightgreyColor,
              ),
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        SizedBox(width: 20.w),
        const CustomHomeFiterSearchBtn(),
      ],
    );
  }
}
