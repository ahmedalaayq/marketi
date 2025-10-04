import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:marketi/core/assets_manager/assets_manager.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/core/theme/light_colors.dart';
import 'package:marketi/features/home/views/widgets/custom_home_fiter_search_btn.dart';
import 'package:marketi/features/home/views/widgets/custom_home_product_grid_item.dart';
import 'package:marketi/features/home/views/widgets/custom_home_product_sliver_grid.dart';
import 'package:marketi/features/home/views/widgets/custom_home_search_field.dart';
import 'package:marketi/features/home/views/widgets/custom_home_top_section.dart';

import 'widgets/custom_home_category_section.dart';
part 'widgets/home_view_body.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeViewBody();
  }
}