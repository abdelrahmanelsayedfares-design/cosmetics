import 'package:cosmetics/core/logic/cash_helper.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_images.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/ui/app_buttom.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final List = [
    _Model(
      image: 'on_boarding_1.png',
      text: 'WELCOME!',
      des:
          'Makeup has the power to transform your\n mood and empowers you to be a more confident person.',
    ),
    _Model(
      image: 'on_boarding_2.png',
      text: 'SEARCH & PICK!',
      des:
          'We have dedicated set of products and\n routines hand picked for every skin type.',
    ),
    _Model(
      image: 'on_boarding_3.png',
      text: 'PUCH NOTIFICATIONS!',
      des: 'Allow notifications for new makeup &\n cosmetics offers.',
    ),
  ];

  void goToLogin() {
    CashHelper.SetNotFirstTime();
    goTo(LoginView(), canPop: false);
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool islast = currentIndex == List.length - 1;
    final currentModel = List[currentIndex];

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 48.31,
              ).r,
              child: Align(
                alignment: Alignment.topRight,
                child: islast
                    ? null
                    : TextButton(
                        onPressed: goToLogin,
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
              ),
            ),
            AppImage(image: currentModel.image),
            SizedBox(height: 27.92.h),
            Text(
              currentModel.text,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            Text(
              currentModel.des,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 30.h),
            islast
                ? Center(
                    child: AppButtom(
                      text: 'let’s start!',
                      color: Color(0xff434C6D),
                      onPressed: goToLogin,
                    ),
                  )
                : Center(
                    child: FloatingActionButton(
                      onPressed: () {
                        currentIndex++;
                        setState(() {});
                      },
                      child: AppImage(image: 'forward.svg'),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class _Model {
  final String image, text, des;

  _Model({required this.image, required this.text, required this.des});
}
