import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/router/app_routes.dart';
import 'package:marketi/core/utils/service_locator.dart';
import 'package:marketi/core/utils/storage_keys.dart';
import 'package:marketi/core/utils/storage_manager.dart';
import 'package:marketi/features/account/views/account_view.dart';
import 'package:marketi/features/auth/views/login_view.dart';
import 'package:marketi/features/auth/views/sign_up_view.dart';
import 'package:marketi/features/cart/cubit/cart_cubit.dart';
import 'package:marketi/features/cart/views/address_view.dart';
import 'package:marketi/features/cart/views/cart_view.dart';
import 'package:marketi/features/home/cubits/home_categories_cubit.dart';
import 'package:marketi/features/home/cubits/home_product_cubit.dart';
import 'package:marketi/features/home/models/product_model.dart';
import 'package:marketi/features/home/repo/home_repo.dart';
import 'package:marketi/features/main/views/main_view.dart';
import 'package:marketi/features/payment/views/payment_view.dart';
import 'package:marketi/features/product_details/views/product_details_view.dart';
import 'package:marketi/features/splash/views/splash_view.dart';

class RouterManager {
  static final GoRouter routerManager = GoRouter(
    initialLocation: AppRoutes.splashView,
    // redirect: (context, state) async {
    //   final token =
    //       await di<StorageManager>().getToken(key: di<StorageKeys>().tokenKey)
    //           as String?;
    //   if (token != null &&
    //       (state.matchedLocation == AppRoutes.loginView ||
    //           state.matchedLocation == AppRoutes.signUpView)) {
    //     return AppRoutes.mainView;
    //   }
    //   return null;
    // },
    routes: <GoRoute>[
      GoRoute(
        path: AppRoutes.splashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRoutes.loginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: AppRoutes.signUpView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: AppRoutes.mainView,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) {
                  final cubit = HomeProductCubit(homeRepo: di<HomeRepo>());
                  cubit.fetchAllProducts();
                  return cubit;
                },
              ),
              BlocProvider(
                create: (context) {
                  final cubit = HomeCategoryCubit(homeRepo: di<HomeRepo>());
                  cubit.fetchAllCategories();
                  return cubit;
                },
              ),
              BlocProvider(create: (context)=> di<CartCubit>()),
            ],
            child: const MainView(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.productDetailsView,
        builder: (context, state) {
          final product = state.extra as ProductModel?;
          return BlocProvider(
            create: (context) => di<CartCubit>(),
            child: ProductDetailsView(product: product),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.cartView,
        builder: (context, state) => const CartView(),
      ),
      GoRoute(
        path: AppRoutes.accountView,
        builder: (context, state) => const AccountView(),
      ),
      GoRoute(
        path: AppRoutes.addressView,
        builder: (context, state) => const AddressView(),
      ),
      GoRoute(
        path: AppRoutes.paymentView,
        builder: (context, state) => const PaymentView(),
      ),
    ],
  );
}


// add to cart ---> Post ()