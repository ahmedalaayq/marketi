part of '../home_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final GlobalKey<CustomHomeCategorySectionState> _resetCategoryKey =
      GlobalKey<CustomHomeCategorySectionState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
      child: RefreshIndicator.adaptive(
        color: LightColors.lightWhiteColor,
        backgroundColor: LightColors.primaryColor,
        onRefresh: () async {
          _resetCategoryKey.currentState?.resetCategories();
          await context.read<HomeProductCubit>().fetchAllProducts();
        },
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(child: CustomHomeTopSection()),
            BlocBuilder<HomeCategoryCubit, HomeCategoriesState>(
              builder: (context, state) {
                if (state is HomeCategorySuccessState) {
                  return SliverToBoxAdapter(
                    child: CustomHomeCategorySection(
                      key: _resetCategoryKey,
                      categories: state.categories,
                      onCategorySelected: (categoryName) {
                        if (categoryName == 'All') {
                          context.read<HomeProductCubit>().fetchAllProducts();
                        } else {
                          context
                              .read<HomeProductCubit>()
                              .fetchProductsByCategory(categoryName);
                        }
                      },
                    ),
                  );
                } else {
                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                }
              },
            ),
            SliverPadding(padding: EdgeInsets.only(top: 24.h)),
            BlocBuilder<HomeProductCubit, HomeProductState>(
              builder: (context, state) {
                if (state is HomeProductLoadingState) {
                  return SliverPadding(
                    padding: EdgeInsets.only(top: 8.h),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.white,
                          child: _buildSkeletonItem(context),
                        );
                      }, childCount: 6),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: 0.68,
                          ),
                    ),
                  );
                } else if (state is HomeProductSuccessState) {
                  return CustomHomeProductSliverGrid(products: state.products);
                } else if (state is HomeProductFailureState) {
                  return const SliverFillRemaining(
                    hasScrollBody: false,
                    child: ErrorView(),
                  );
                }
                return const SliverToBoxAdapter(child: SizedBox());
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildSkeletonItem(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(bottom: 8.h),
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.03),
          blurRadius: 6,
          spreadRadius: 1,
        ),
      ],
    ),
  );
}
