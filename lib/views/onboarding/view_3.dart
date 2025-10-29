import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/ui/app_buttom.dart';
import '../auth/login.dart';

class OnBoardingThree extends StatelessWidget {
  const OnBoardingThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImage(
              image: 'on_boarding_3.png',
              // width: 206.566162109375.w,
              // height: 210.8333282470703.h,
            ),
            SizedBox(height: 67.08.h),
            Text(
              'PUCH NOTIFICATIONS ',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 10.h),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'Allow notifications for new makeup &\n'),
                  TextSpan(text: 'cosmetics offers.'),
                ],
              ),
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.h),
            AppButtom(
              text: 'let’s start!',
              onPressed: () {
              goTo(LoginView(),canPop: false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
