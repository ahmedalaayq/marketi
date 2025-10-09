import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/router/app_routes.dart';
import 'package:marketi/core/utils/service_locator.dart';
import 'package:marketi/core/utils/storage_keys.dart';
import 'package:marketi/core/utils/storage_manager.dart';

class SplashViewController {
  SplashViewController();
  navigateToMainView(BuildContext context) async {
     Timer(const Duration(seconds: 3,milliseconds: 5), () async {
      final String? token =
          await di<StorageManager>().getToken(key: di<StorageKeys>().tokenKey)
              as String?;

      if (token != null && token.isNotEmpty) {
        if (!context.mounted) return;
        GoRouter.of(context).go(AppRoutes.mainView);
      } else {
        if (!context.mounted) return;
        GoRouter.of(context).go(AppRoutes.loginView);
      }
    });
  }
}
