import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/logic/input_validator.dart';
import 'package:cosmetics/core/ui/app_images.dart';
import 'package:cosmetics/core/ui/app_login_or_register.dart';
import 'package:cosmetics/views/auth/creat_account/view.dart';
import 'package:cosmetics/views/auth/login/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/ui/app_buttom.dart';
import '../../../core/ui/app_input.dart';
import '../forget_password/view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(
        builder: (context) {
          final cubit = BlocProvider.of<LoginCubit>(context);
          return Scaffold(
            body: SafeArea(
              child: Form(
                key: cubit.formKey,
                onChanged: cubit.onChangeFormData,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.r).copyWith(top: 48.r),
                        child: AppImage(image: 'login.png', width: 284, height: 227),
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        'Login Now',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 14.h),
                      Text(
                        'Please enter the details below to continue',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(height: 24.h),
                      AppInput(
                        controller: cubit.phoneController,
                        labelText: 'Phone Number',
                        TextInputTypee: TextInputType.phone,
                        withCountrycode: true,
                        onCountryCodeChanged: cubit.onCountryCodeChanged,
                        validator: InputValidator.phoneValidator,
                      ),
                      AppInput(
                        controller: cubit.passController,
                        labelText: 'Your Password',
                        TextInputTypee: TextInputType.text,
                        isPassword: true,
                        bootomSpace: 0,
                        validator: InputValidator.passwordValidator,
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
                      BlocBuilder(
                        bloc: cubit,
                        builder: (context,state) {
                          return AppButtom(
                            isLoading: cubit.isLoading,
                            text: 'Login',
                            onPressed: () => cubit.login(),
                          );
                        }
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: AppLoginOrRegister(
              text: 'Register',
              onPressed: () => goTo(CreateAccountView(), canPop: true),
            ),
          );
        }
      ),
    );
  }
}
