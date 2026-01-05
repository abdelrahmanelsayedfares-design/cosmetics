import 'package:cosmetics/core/logic/dio_helper.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/logic/input_validator.dart';
import 'package:cosmetics/core/ui/app_images.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:cosmetics/views/auth/verify_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/ui/app_buttom.dart';
import '../../core/ui/app_input.dart';
import 'package:cosmetics/core/ui/app_login_or_register.dart';

class CreatAccountView extends StatefulWidget {
  CreatAccountView({super.key});

  @override
  State<CreatAccountView> createState() => _CreatAccountViewState();
}

class _CreatAccountViewState extends State<CreatAccountView> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  final emailController = TextEditingController();
  String? selectedCounterCode;
  bool isLoginClicked = false;

  Future<void> sendData() async {
    final name = nameController.text.trim();
    final phone = phoneController.text.trim();
    final password = passController.text.trim();
    final email = emailController.text.trim();
    print(phone);
    print(password);
    print(selectedCounterCode);

    final resp = await DioHelper.sendData(
      path: 'api/Auth/register',
      data: {
        "username": name,
        "countryCode": selectedCounterCode,
        "phoneNumber": phone,
        "email": email,
        "password": password,
      },
    );
    if (resp.isSuccess) {
      showMasg('Regiter Success');
    } else {
      showMasg(resp.msg, isError: true);
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
                  controller: nameController,
                  labelText: 'Your Name',
                  TextInputTypee: TextInputType.text,
                ),
                AppInput(
                  controller: phoneController,
                  labelText: 'Phone Number',
                  TextInputTypee: TextInputType.phone,
                  withCountrycode: true,
                  onCountryCodeChanged: (value) {
                    selectedCounterCode = value;
                  },
                  validator: InputValidator.phoneValidator,
                ),
                AppInput(
                  controller: emailController,
                  labelText: 'your Email',
                  TextInputTypee: TextInputType.emailAddress,
                  // isPassword: true,
                  bootomSpace: 0,
                  validator: InputValidator.passwordValidator,
                ),
                AppInput(
                  controller: passController,
                  labelText: 'Create your password',
                  TextInputTypee: TextInputType.text,
                  isPassword: true,
                  validator: InputValidator.passwordValidator,
                ),


                SizedBox(height: 43.h),
                AppButtom(
                  text: 'Next',
                  onPressed: () {
                    isLoginClicked = true;
                    if (formKey.currentState!.validate()) {
                      sendData();
                      goTo(
                        VerifyCodeView(isFromForgotPassword: false),
                        canPop: false,

                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppLoginOrRegister(
        text: 'Login',
        onPressed: () {
          goTo(LoginView(), canPop: false);
        },
      ),
    );
  }
}
