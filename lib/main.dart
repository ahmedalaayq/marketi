import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/router/router_manager.dart';
import 'package:marketi/core/theme/light_theme.dart';

void main() {
  runApp(const Marketi());
}

class Marketi extends StatelessWidget {
  const Marketi({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      ensureScreenSize: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: RouterManager.routerManager,
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          themeMode: ThemeMode.light,
        );
      },
    );
  }
}
