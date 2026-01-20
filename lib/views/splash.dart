import 'package:cosmetics/core/logic/cash_helper.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_images.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:cosmetics/views/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    goTo(
      CashHelper.isFirstTime ? OnBoardingView() : LoginView(),
      canPop: false,
      delayInSeconds: 3,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinPerfect(
              duration: Duration(seconds: 2),
              child: AppImage(
                image: 'splash_image1.png',
                width: 200.w,
                height: 200.h,
              ),
            ),
            SizedBox(height: 16.h),
            AppImage(image: 'splash_image2.png', width: 120.w, height: 46.h),
          ],
        ),
      ),
    );
  }
}
