import 'package:flutter/material.dart';
import 'package:marketi/core/theme/light_colors.dart';
import 'package:marketi/core/utils/service_locator.dart';
import 'package:marketi/features/splash/controller/splash_view_controller.dart';
import 'widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    di<SplashViewController>().navigateToMainView(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.primaryColor.withValues(alpha: 0.5),
      body: const SplashViewBody());
  }
}
