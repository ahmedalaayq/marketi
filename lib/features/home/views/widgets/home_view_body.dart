part of '../home_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          /// Title + Search
          const SliverToBoxAdapter(child: CustomHomeTopSection()),

          /// Categories
          const SliverToBoxAdapter(child: CustomHomeCategorySection()),

          SliverPadding(padding: EdgeInsets.only(top: 24.h)),

          /// Products Grid
          const CustomHomeProductSliverGrid(),
        ],
      ),
    );
  }
}
