import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:marketi/core/assets_manager/assets_manager.dart';
import 'package:marketi/core/networking/api_service.dart';
import 'package:marketi/core/theme/app_text_style.dart';
import 'package:marketi/core/theme/light_colors.dart';
import 'package:marketi/core/utils/service_locator.dart';
import 'package:marketi/features/home/cubits/home_categories_cubit.dart';
import 'package:marketi/features/home/cubits/home_categories_state.dart';
import 'package:marketi/features/home/cubits/home_product_cubit.dart';
import 'package:marketi/features/home/cubits/home_product_state.dart';
import 'package:marketi/features/home/models/product_model.dart';
import 'package:marketi/features/home/repo/home_repo.dart';
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