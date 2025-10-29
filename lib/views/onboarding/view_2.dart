import 'package:cosmetics/core/ui/app_images.dart';
import 'package:cosmetics/views/onboarding/view_1.dart';
import 'package:cosmetics/views/onboarding/view_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/logic/helper_methods.dart';

class OnBoardingTwo extends StatelessWidget {
  const OnBoardingTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 48.31,
              ).r,
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    goTo(OnBoardingThree(),canPop: false );

                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff434C6D),
                    ),
                  ),
                ),
              ),
            ),
            // SizedBox(height: 48.31,),
            AppImage(image: 'on_boarding_2.png'),
            SizedBox(height: 21.34.h),
            Text(
              'SEARCH & PICK',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              'We have dedicated set of products and\n routines hand picked for every skin type.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 32.h),
            Buttom(
              onprssd: () {
               goTo(OnBoardingThree(),canPop: false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
