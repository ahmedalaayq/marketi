part of '../home_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: CustomHomeTopSection()),
          BlocBuilder<HomeCategoryCubit, HomeCategoriesState>(
            builder: (context, state) {
              if (state is HomeCategorySuccessState) {
                
                return SliverToBoxAdapter(
                  child: CustomHomeCategorySection(
                    categories: state.categories,
                    onCategorySelected: (categoryName) {
                      context.read<HomeProductCubit>().fetchProductsByCategory(categoryName);
                    },
                  ),
                );
              }else
              {
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
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Text(
                      state.errorMessage,
                      style: AppTextStyle.semiBold16.copyWith(
                        color: LightColors.redColor,
                      ),
                    ),
                  ),
                );
              }
              return const SliverToBoxAdapter(child: SizedBox());
            },
          ),
        ],
      ),
    );
  }
}
