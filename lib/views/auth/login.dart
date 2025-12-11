import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/logic/input_validator.dart';
import 'package:cosmetics/core/ui/app_images.dart';
import 'package:cosmetics/core/ui/app_login_or_register.dart';
import 'package:cosmetics/views/auth/creat_account.dart';
import 'package:cosmetics/views/home/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/ui/app_buttom.dart';
import '../../core/ui/app_input.dart';
import 'forget_password.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? selectedCounterCode;
  final phoneController=TextEditingController();
  final passController=TextEditingController();
  final formKey=GlobalKey<FormState>();
  bool isLoginClicked=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          onChanged: () {
            if(isLoginClicked){
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
                    image: 'login.png',
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
                  controller:phoneController ,
                  labelText: 'Phone Number',
                  TextInputTypee: TextInputType.phone,
                  withCountrycode: true,
                 onCountryCodeChanged: (value) {
                   selectedCounterCode=value;
                 },
                    validator:InputValidator.phoneValidator,
                ),
                AppInput(
                  controller: passController,
                  labelText: 'Your Password',
                  TextInputTypee: TextInputType.text,
                  isPassword: true,
                  bootomSpace: 0,
                  validator:InputValidator.passwordValidator,
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
                  isLoading: false,
                  text: 'Login',
                  onPressed: () {
                    isLoginClicked=true;
                    if(formKey.currentState!.validate()){
                      final phone=phoneController.text.trim();
                      final password=passController.text.trim();
                      print(phone);
                      print(password);
                      print(selectedCounterCode);
                      // goTo(HomeViews(), canPop: false);
                    }

                  },
                ),
              ],
            ),
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
