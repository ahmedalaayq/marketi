import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/core/assets_manager/assets_manager.dart';
import 'package:marketi/core/theme/light_colors.dart';
import 'package:marketi/features/cart/views/cart_view.dart';
import 'package:marketi/features/home/views/home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final List<Widget> _views = [
    const HomeView(),
     const CartView(),
    Container(color: LightColors.redColor),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _views[_currentIndex]),
      bottomNavigationBar: Container(
        height: 86.h,
        decoration: BoxDecoration(
          color: Colors.white,
          border: const Border(
            top: BorderSide(width: 1, color: Color(0xFFE6E6E6)),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, -2),
            )
          ],
        ),
        child: NavigationBar(
          animationDuration: const Duration(milliseconds: 400),
          backgroundColor: Colors.transparent,
          elevation: 0,
          height: 86.h,
          selectedIndex: _currentIndex,
          indicatorColor: LightColors.primaryColor.withValues(alpha: 0.1),
          onDestinationSelected: (i) => setState(() => _currentIndex = i),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          destinations: [
            _buildDestination(
              index: 0,
              icon: AssetsManager.homeNavBarIcon,
              label: 'Home',
            ),
            _buildDestination(
              index: 1,
              icon: AssetsManager.cartNavBarIcon,
              label: 'Cart',
            ),
            _buildDestination(
              index: 2,
              icon: AssetsManager.accountNavBarIcon,
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }

  NavigationDestination _buildDestination({
    required int index,
    required String icon,
    required String label,
  }) {
    final isSelected = _currentIndex == index;
    return NavigationDestination(
      icon: SvgPicture.asset(
        icon,
        width: 26.w,
        height: 26.w,
        colorFilter: ColorFilter.mode(
          isSelected ? LightColors.primaryColor : LightColors.lightgreyColor,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }
}
