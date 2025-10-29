import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/views/home/views.dart';
import 'package:flutter/material.dart' hide Dialog;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../core/ui/app_images.dart';
import '../../core/ui/app_buttom.dart';
import 'creat_account.dart';
import 'success.dart';
import 'creat_password.dart';

class VerifyCodeView extends StatelessWidget {
  final bool isFromForgotPassword;

  const VerifyCodeView({super.key, this.isFromForgotPassword = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40).r,
            child: Column(
              children: [
                AppImage(
                  image: 'creeat_account.svg',
                  width: 67.w,
                  height: 62.h,
                ),
                SizedBox(height: 40),
                Text('Verify Code'),
                SizedBox(height: 40),
                Text(
                  'We just sent a 4-digit verification code to ',
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                Row(
                  children: [
                    Text(
                      '+20 1022658997.',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Enter the code in the box',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Text(
                  'below to continue.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: (){
                      goTo(CreatAccountView(),canPop: false);
                    },
                    child: Text(
                      'Edit the number',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffD75D72),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  cursorColor: const Color(0xffD75D72),
                  animationDuration: const Duration(milliseconds: 10),
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
                    inactiveFillColor: Colors.transparent,
                    selectedColor: const Color(0xffD75D72),
                    selectedFillColor: Colors.transparent,
                    activeColor: const Color(0xffD75D72),
                    activeFillColor: Colors.transparent,
                    inactiveBorderWidth: 1,
                  ),
                ),
                SizedBox(height: 43),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Didn’t receive a code? ',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff434C6D),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Resend',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffD75D72).withValues(alpha: .54),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '0:36',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff8E8EA9),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 113),
                AppButtom(
                  text: 'Done',
                  onPressed: (){
                    if (isFromForgotPassword) {
                     goTo(CreatPasswordView(),canPop: false);
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return SuccesDialog();
                        },
                      );
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

