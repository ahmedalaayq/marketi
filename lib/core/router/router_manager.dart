import 'package:go_router/go_router.dart';
import 'package:marketi/core/router/app_routes.dart';
import 'package:marketi/features/auth/views/login_view.dart';
import 'package:marketi/features/auth/views/sign_up_view.dart';

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
    ],
  );
}
