import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_images.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:cosmetics/views/auth/verify_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/ui/app_buttom.dart';
import '../../core/ui/app_input.dart';
import 'package:cosmetics/core/ui/app_login_or_register.dart';

class CreatAccountView extends StatelessWidget {
  CreatAccountView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.r).copyWith(top: 48.r),
                child: AppImage(
                  image: 'splash_image1.png',
                  width: 67,
                  height: 62,
                ),
              ),
              SizedBox(height: 40.h),
              Text(
                'Create Account',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 71.94.h),

              AppInput(
                labelText: 'Your Name',
                TextInputTypee: TextInputType.text,
              ),
              AppInput(
                labelText: 'Phone Number',
                TextInputTypee: TextInputType.phone,
                withCountrycode: true,
              ),
              AppInput(
                labelText: 'Create your password',
                TextInputTypee: TextInputType.text,
                isPassword: true,
              ),
              AppInput(
                labelText: 'Confirm password',
                TextInputTypee: TextInputType.text,
                isPassword: true,
                bootomSpace: 0,
              ),

              SizedBox(height: 43.h),
              AppButtom(text: 'Next', onPressed: () {
             goTo(VerifyCodeView(isFromForgotPassword: false),canPop: false);
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppLoginOrRegister(text: 'Login',onPressed: (){
        goTo(LoginView(),canPop: false);
      },),
    );
  }
}
