import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/core/assets_manager/assets_manager.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/core/theme/light_colors.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final List<Widget> _views = [
    Container(color: LightColors.primaryColor),
    Container(color: LightColors.starColor),
    Container(color: LightColors.redColor),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: _views[_currentIndex],
      bottomNavigationBar: Container(
        width: 390.w,
        height: 86.h,
        clipBehavior: Clip.antiAlias,
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFE6E6E6)),
          ),
        ),
        child: BottomNavigationBar(
          selectedItemColor: LightColors.primaryColor,
          unselectedItemColor: LightColors.greyColor,
          iconSize: 27.sp,
          unselectedLabelStyle: AppTextStyle.medium12.copyWith(height: 2.0.h),
          selectedLabelStyle: AppTextStyle.medium12.copyWith(height: 2.0.h),
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                colorFilter: ColorFilter.mode(
                  _currentIndex == 0
                      ? LightColors.primaryColor
                      : LightColors.lightgreyColor,
                  BlendMode.srcIn,
                ),
                AssetsManager.homeNavBarIcon,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                colorFilter: ColorFilter.mode(
                  _currentIndex == 1
                      ? LightColors.primaryColor
                      : LightColors.lightgreyColor,
                  BlendMode.srcIn,
                ),
                AssetsManager.cartNavBarIcon),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                colorFilter: ColorFilter.mode(
                  _currentIndex == 2
                      ? LightColors.primaryColor
                      : LightColors.lightgreyColor,
                  BlendMode.srcIn,
                ),
                AssetsManager.accountNavBarIcon),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
