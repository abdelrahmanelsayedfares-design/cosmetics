import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_images.dart';
import 'package:cosmetics/core/ui/app_login_or_register.dart';
import 'package:cosmetics/views/auth/creat_account.dart';
import 'package:cosmetics/views/home/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/ui/app_buttom.dart';
import '../../core/ui/app_input.dart';
import '../on_boarding.dart';
import 'forget_password.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                  image: 'login_img.png',
                  width: 284,
                  height: 227,
                ),
              ),
              SizedBox(height: 24.h),
              Text('Login Now', style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: 14.h),
              Text(
                'Please enter the details below to continue',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: 24.h),
              AppInput(
                labelText: 'Phone Number',
                TextInputTypee: TextInputType.phone,
                withCountrycode: true,
              ),
              AppInput(
                labelText: 'Your Password',
                TextInputTypee: TextInputType.text,
                isPassword: true,
                bootomSpace: 0,
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: () {
                    goTo(ForgetPasswordView(), canPop: true);
                  },
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xffD75D72),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 43.h),
              AppButtom(
                text: 'Login',
                onPressed: () {
                  goTo(HomeViews(), canPop: false);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppLoginOrRegister(
        text: 'Register',
        onPressed: () {
          goTo(CreatAccountView(), canPop: true);
        },
      ),
    );
  }
}
