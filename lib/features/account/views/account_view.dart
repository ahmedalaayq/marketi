import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/core/assets_manager/assets_manager.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/core/theme/light_colors.dart';
import 'package:marketi/features/cart/views/widgets/custom_cart_appbar.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    const CustomCartAppbar(title: 'Account'),
                    const Divider(color: LightColors.lightWhiteColor),

                    //todo: --- Orders ---
                    _buildAccountTile(
                      title: 'My Orders',
                      img: AssetsManager.accountBoxIcon,
                    ),
                    SizedBox(height: 8.h),
                    Divider(thickness: 8.h, color: LightColors.lightWhiteColor),

                    SizedBox(height: 16.h),

                    //todo: --- Details & Address ---
                    _buildAccountTile(
                      title: 'My Details',
                      img: AssetsManager.accountDetailsIcon,
                    ),
                    _dividerInset(),
                    _buildAccountTile(
                      title: 'Address Book',
                      img: AssetsManager.accountAddressBookIcon,
                    ),

                    SizedBox(height: 16.h),

                    //todo: --- FAQs ---
                    _buildAccountTile(
                      title: 'FAQs',
                      img: AssetsManager.accountFAQsIcon,
                    ),
                    _dividerInset(),

                    SizedBox(height: 16.h),

                    //todo --- Help Center ---
                    _buildAccountTile(
                      title: 'Help Center',
                      img: AssetsManager.accountHelpCenterIcon,
                    ),

                    Divider(thickness: 8.h, color: LightColors.lightWhiteColor),
                    SizedBox(height: 16.h),

                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24.w),
              decoration: BoxDecoration(
                color: LightColors.redColor.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: _buildAccountTile(title: 'Logout'),
            ),)
          ],
        ),
      ),
    );
  }

  Widget _dividerInset() {
    return Divider(
      indent: 64.w,
      endIndent: 16.w,
      color: LightColors.lightWhiteColor,
    );
  }
}

Widget _buildAccountTile({
  required String title,
  String? img,
  Function()? onTap,
}) {
  return ListTile(
    onTap: onTap,
    leading:
        img != null
            ? SvgPicture.asset(img, width: 28.w, height: 28.h)
            : const Icon(Icons.logout, color: LightColors.redColor),
    title: Text(
      title,
      style:
          img != null
              ? AppTextStyle.regular16Black
              : AppTextStyle.regular16.copyWith(color: LightColors.redColor),
    ),
    trailing: const Icon(
      Icons.arrow_forward_ios,
      size: 18,
      color: LightColors.trailingIconColor,
    ),
  );
}
