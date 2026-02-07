import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:cosmetics/core/logic/dio_helper.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/views/auth/verify/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/ui/app_back.dart';
import '../../../core/ui/app_images.dart';
import '../../../core/ui/app_buttom.dart';
import '../creat_account/view.dart';
import '../creat_password/view.dart';

class VerifyCodeView extends StatelessWidget {
  final String? phoneNumber;
  final String? countryCode;
  final bool isFromForgotPassword;

  const VerifyCodeView({
    super.key,
    this.isFromForgotPassword = false,
    this.phoneNumber,
    this.countryCode,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VerifyCubit(
        phoneNumber: phoneNumber ?? '',
        countryCode: countryCode ?? '',
        isFromForgotPassword: isFromForgotPassword,
      ),
      child: BlocListener<VerifyCubit, DataState>(
        listener: (context, state) {
          if (state == DataState.success) {
            if (isFromForgotPassword) {
              goTo(
                CreatePasswordView(
                  phoneNumber: phoneNumber??'',
                  countryCode: countryCode??'',
                ),
                canPop: false,
              );
            }
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ).r,
                child: Column(
                  children: [
                    AppBack(),

                    AppImage(
                      image: 'splash_image1.png',
                      width: 67.w,
                      height: 62.h,
                    ),

                    const SizedBox(height: 40),

                    const Text('Verify Code'),

                    const SizedBox(height: 40),

                    Text(
                      'We just sent a 4-digit verification code to ',
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),

                    Row(
                      children: [
                        Text(
                          '${countryCode ?? ''} ${phoneNumber ?? ''}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          ' Enter the code',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),

                    Text(
                      'below to continue.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),

                    const SizedBox(height: 40),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          goTo(CreateAccountView(), canPop: false);
                        },
                        child: const Text(
                          'Edit the number',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffD75D72),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// OTP
                    BlocBuilder<VerifyCubit, DataState>(
                      builder: (context, state) {
                        final cubit = context.watch<VerifyCubit>();

                        return PinCodeTextField(
                          controller: cubit.otp,
                          appContext: context,
                          length: 4,
                          keyboardType: TextInputType.number,
                          animationType: AnimationType.fade,
                          cursorColor: const Color(0xffD75D72),
                          animationDuration:
                          const Duration(milliseconds: 200),
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          textStyle: const TextStyle(
                            color: Color(0xff434C6D),
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(8),
                            fieldHeight: 45,
                            fieldWidth: 45,
                            borderWidth: 1,
                            inactiveColor: const Color(0xff8989925C),
                            selectedColor: const Color(0xffD75D72),
                            activeColor: const Color(0xffD75D72),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 40),

                    /// Timer
                    StreamBuilder<int>(
                      stream: Stream.periodic(
                        const Duration(seconds: 1),
                            (i) => i,
                      ).take(61),
                      builder: (context, snapshot) {
                        int remaining = 60 - (snapshot.data ?? 0);

                        return Text(
                          "0:${remaining.toString().padLeft(2, '0')}",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff8E8EA9),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 100),

                    /// Button
                    BlocBuilder<VerifyCubit, DataState>(
                      builder: (context, state) {
                        final cubit = context.watch<VerifyCubit>();

                        return AppButtom(
                          text: 'Done',
                          isLoading: state == DataState.loading,
                          onPressed: state == DataState.loading
                              ? null
                              : () {
                            final otp = cubit.otp.text.trim();

                            if (otp.length != 4) {
                              showMasg(
                                'Enter verification code',
                                isError: true,
                              );
                              return;
                            }

                            cubit.sendData();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}