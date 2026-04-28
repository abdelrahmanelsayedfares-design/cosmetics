import 'package:cosmetics/core/logic/dio_helper.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/logic/input_validator.dart';
import 'package:cosmetics/core/ui/app_images.dart';
import 'package:cosmetics/views/auth/creat_account/cubit.dart';
import 'package:cosmetics/views/auth/login/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/ui/app_buttom.dart';
import '../../../core/ui/app_input.dart';
import 'package:cosmetics/core/ui/app_login_or_register.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Builder(
        builder: (context) {
          final cubit = BlocProvider.of <RegisterCubit>(context);
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
                        controller: cubit.nameController,
                        labelText: 'Your Name',
                        TextInputTypee: TextInputType.text,
                      ),
                      AppInput(
                        controller: cubit.phoneController,
                        labelText: 'Phone Number',
                        TextInputTypee: TextInputType.phone,
                        withCountrycode: true,
                        onCountryCodeChanged: cubit.onCountryCodeChanged,
                        validator: InputValidator.phoneValidator,
                      ),
                      AppInput(
                        controller: cubit.emailController,
                        labelText: 'your Email',
                        TextInputTypee: TextInputType.emailAddress,
                        // isPassword: true,
                        bootomSpace: 0,
                        validator: InputValidator.passwordValidator,
                      ),
                      AppInput(
                        controller: cubit.passController,
                        labelText: 'Create your password',
                        TextInputTypee: TextInputType.text,
                        isPassword: true,
                        validator: InputValidator.passwordValidator,
                      ),
                      SizedBox(height: 43.h),
                      BlocBuilder(
                        bloc: cubit,
                        builder: (context,state) {
                          return AppButtom(
                            isLoading: cubit.state == DataState.loading,
                            text: 'Next',
                            onPressed: cubit.state == DataState.loading
                                ? null
                                : cubit.register,
                          );
                        }
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: AppLoginOrRegister(
              text: 'Login',
              onPressed: () => goTo(LoginView(), canPop: false),
            ),
          );
        }
      ),
    );
  }
}
