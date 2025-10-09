import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:marketi/core/theme/light_colors.dart';
import 'package:marketi/features/home/cubits/home_categories_cubit.dart';
import 'package:marketi/features/home/cubits/home_categories_state.dart';
import 'package:marketi/features/home/cubits/home_product_cubit.dart';
import 'package:marketi/features/home/cubits/home_product_state.dart';
import 'package:marketi/features/home/models/product_model.dart';
import 'package:marketi/features/home/views/widgets/custom_home_product_sliver_grid.dart';
import 'package:marketi/features/home/views/widgets/custom_home_top_section.dart';
import 'package:marketi/features/home/views/widgets/error_view.dart';
import 'package:redacted/redacted.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'widgets/custom_home_category_section.dart';
part 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeViewBody();
  }
}
