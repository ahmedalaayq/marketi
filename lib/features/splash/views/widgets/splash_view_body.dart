import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/assets_manager/assets_manager.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),

    );
    _scaleAnimation = Tween<double>(begin: 0.4, end: 0.92).animate(_controller);
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller.removeStatusListener((status) {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return ScaleTransition(
              scale: _scaleAnimation,
              child: Center(
                child: Image.asset(
                  width: 230.w,
                  height: 200.h,
                  AssetsManager.splashIconImage,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
