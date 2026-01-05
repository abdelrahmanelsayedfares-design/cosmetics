import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/logic/input_validator.dart';
import 'package:cosmetics/core/ui/app_images.dart';
import 'package:cosmetics/views/auth/verify_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/logic/dio_helper.dart';
import '../../core/ui/app_back.dart';
import '../../core/ui/app_buttom.dart';
import '../../core/ui/app_input.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final phoneController = TextEditingController();
  String? selectedCounterCode;
  final formKey = GlobalKey<FormState>();
  bool isLoginClicked = false;

  Future<void> sendData() async {
    final phone = phoneController.text.trim();
    final resp = await DioHelper.sendData(
      path: 'api/Auth/forgot-password',
      data: {"countryCode": selectedCounterCode, "phoneNumber": phone},
    );
    if (resp.isSuccess) {
      showMasg(resp.data?['message']);
    } else {
      showMasg(resp.msg, isError: true);
      print(resp.msg??'message');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          onChanged: () {
            if (isLoginClicked) {
              formKey.currentState!.validate();
            }
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ).r,
                  child: AppBack(),
                ),
                Padding(
                  padding: EdgeInsets.all(16.r).copyWith(top: 48.r),
                  child: AppImage(
                    image: 'splash_image1.png',
                    width: 67,
                    height: 62,
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  'Forget Password',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 14.h),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'Please enter your phone number below\n'),
                      TextSpan(
                        text: 'to recovery your password.',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(height: 24.h),
                AppInput(
                  controller: phoneController,
                  labelText: 'Phone Number',
                  TextInputTypee: TextInputType.phone,
                  withCountrycode: true,
                  validator: InputValidator.phoneValidator,
                ),
                SizedBox(height: 55.94.h),
                AppButtom(
                  text: 'Next',
                  onPressed: () {
                    isLoginClicked = true;
                    if (formKey.currentState!.validate()) {
                      // goTo(
                      //   VerifyCodeView(isFromForgotPassword: true),
                      //   canPop: true,
                      // );
                      sendData();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
