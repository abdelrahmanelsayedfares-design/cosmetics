import 'package:cosmetics/core/ui/app_images.dart';
import 'package:cosmetics/views/auth/success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/ui/app_buttom.dart';
import '../../core/ui/app_input.dart';

class CreatPasswordView extends StatelessWidget {
  CreatPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 94).r,
                child: Center(
                  child: AppImage(
                    image: 'creeat_account.svg',
                    width: 67.w,
                    height: 62.h,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Text(
                'Create Password',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 40.h),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'The password should have at least\n'),
                    TextSpan(text: ' 8 characters'),
                  ],
                ),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: 80.h),
              AppInput(
                labelText: 'Your Password',
                TextInputTypee: TextInputType.text,
                isPassword: true,
              ),
              AppInput(
                labelText: 'Your Password',
                TextInputTypee: TextInputType.text,
                isPassword: true,
                bootomSpace: 0,
              ),

              SizedBox(height: 71.88.h),
              AppButtom(
                text: 'Confirm',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SuccesDialog(isFromCreatePassword: true);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
