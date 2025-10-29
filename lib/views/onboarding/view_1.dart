import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_images.dart';
import 'package:cosmetics/views/onboarding/view_2.dart';
import 'package:cosmetics/views/onboarding/view_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingOne extends StatelessWidget {
  const OnBoardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 48.31).r,
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
            AppImage(image: 'on_boarding_1.png',),
            SizedBox(height: 27.92.h),
            Text('WELCOME!', style: Theme.of(context).textTheme.labelMedium),
            SizedBox(height: 10.h),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'Makeup has the power to transform your\n '),
                  TextSpan(text: 'mood and empowers you to be a more\n'),
                  TextSpan(text: ' confident person.'),
                ],
              ),
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.h),
            Buttom(
              onprssd: () {
               goTo(OnBoardingTwo(),canPop: false);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Buttom extends StatelessWidget {
  final VoidCallback? onprssd;
  const Buttom({super.key, required this.onprssd});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff434C6D),
        minimumSize: Size(50.w, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
      ),
      onPressed: onprssd,
      child: AppImage(image: 'icon_boarding.svg'),
    );
  }
}
