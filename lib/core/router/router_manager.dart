import 'package:go_router/go_router.dart';
import 'package:marketi/core/router/app_routes.dart';
import 'package:marketi/features/account/views/account_view.dart';
import 'package:marketi/features/auth/views/login_view.dart';
import 'package:marketi/features/auth/views/sign_up_view.dart';
import 'package:marketi/features/cart/views/address_view.dart';
import 'package:marketi/features/cart/views/cart_view.dart';
import 'package:marketi/features/main/views/main_view.dart';
import 'package:marketi/features/product_details/views/product_details_view.dart';

class RouterManager {
  static final GoRouter routerManager = GoRouter(
    initialLocation: AppRoutes.loginView,
    routes: <GoRoute>[
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
        builder: (context, state) => const MainView(),
      ),
      GoRoute(
        path: AppRoutes.productDetailsView,
        builder: (context, state) => const ProductDetailsView(),
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
    ],
  );
}
