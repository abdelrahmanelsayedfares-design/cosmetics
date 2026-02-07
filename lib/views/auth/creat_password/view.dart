import 'package:cosmetics/core/logic/dio_helper.dart';
import 'package:cosmetics/core/ui/app_images.dart';
import 'package:cosmetics/views/auth/creat_account/view.dart';
import 'package:cosmetics/views/auth/creat_password/cubit.dart';
import 'package:cosmetics/views/auth/success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/logic/helper_methods.dart';
import '../../../core/ui/app_buttom.dart';
import '../../../core/ui/app_input.dart';

class CreatePasswordView extends StatelessWidget {
  final String? phoneNumber;
  final String? countryCode;

  const CreatePasswordView({super.key, this.phoneNumber, this.countryCode});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatePasswordCubit(
        phoneNumber: phoneNumber ?? '',
        countryCode: countryCode ?? '',
      ),
      child: BlocListener<CreatePasswordCubit,DataState>(
        listener: (context, state) {
          if (state == DataState.success) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => SuccessDialog(isFromCreatePassword: true),
            );
          }
        },
        child: Builder(
          builder: (context) {
            final cubit = BlocProvider.of<CreatePasswordCubit>(context);
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
                            image: 'splash_image1.png',
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
                        controller: cubit.password,
                        labelText: 'Your Password',
                        TextInputTypee: TextInputType.text,
                        isPassword: true,
                      ),
                      AppInput(
                        controller: cubit.confirmPassword,
                        labelText: 'Your Password',
                        TextInputTypee: TextInputType.text,
                        isPassword: true,
                        bootomSpace: 0,
                      ),

                      SizedBox(height: 71.88.h),
                      BlocBuilder(
                        bloc: cubit,
                        builder: (context,state) {
                          return AppButtom(
                            text: 'Confirm',
                            isLoading: cubit.isLoading,
                            onPressed: cubit.confirm,
                          );
                        }
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
