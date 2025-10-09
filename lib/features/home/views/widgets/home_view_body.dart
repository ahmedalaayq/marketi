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
                  return const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(child: CircularProgressIndicator()),
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
