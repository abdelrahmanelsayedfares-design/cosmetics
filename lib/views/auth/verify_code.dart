import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:cosmetics/core/logic/dio_helper.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../core/ui/app_back.dart';
import '../../core/ui/app_images.dart';
import '../../core/ui/app_buttom.dart';
import 'creat_account.dart';
import 'success.dart';
import 'creat_password.dart';

class VerifyCodeView extends StatefulWidget {
  final String? phoneNumber;
  final String? countryCode;
  final bool isFromForgotPassword;

  VerifyCodeView({
    super.key,
    this.isFromForgotPassword = false,
     this.phoneNumber,
     this.countryCode,
  });

  @override
  State<VerifyCodeView> createState() => _VerifyCodeViewState();
}

class _VerifyCodeViewState extends State<VerifyCodeView> {
  final otp = TextEditingController();

  Future<void> sendData() async {
    final oTp = otp.text.trim();
    final resp = await DioHelper.sendData(
      path: 'api/Auth/verify-otp',
      data: {
        "countryCode": widget.countryCode,
        "phoneNumber": widget.phoneNumber,
        "otpCode": oTp,
      },
    );
    print('00000000000');
    // if (resp.isSuccess) {
    //   showMasg(resp.data['message']);
    // } else {
    //   showMasg(resp.msg ?? 'Error', isError: true);
    // }
    if (resp.isSuccess) {
      if (widget.isFromForgotPassword) {
        goTo(CreatPasswordView(), canPop: false);
      } else {
        showDialog(
          context: context,
          builder: (_) => SuccesDialog(),
        );
      }
    } else {
      showMasg(resp.msg ?? 'Error', isError: true);
    }
  }

  final CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40).r,
            child: Column(
              children: [
                AppBack(),
                AppImage(image: 'splash_image1.png', width: 67.w, height: 62.h),
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
                    onPressed: () {
                      goTo(CreatAccountView(), canPop: false);
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
                  controller: otp,
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
                    CircularCountDownTimer(
                      duration: 60,
                      initialDuration: 0,
                      controller: _controller,
                      width: 0,
                      height: 0,
                      ringColor: Colors.transparent,
                      fillColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      strokeWidth: 0,
                      isTimerTextShown: false,
                      isReverse: true,
                    ),
                    StreamBuilder<int>(
                      stream: Stream.periodic(
                        const Duration(seconds: 1),
                        (i) => i,
                      ).take(61),
                      builder: (context, snapshot) {
                        int remaining = 60 - (snapshot.data ?? 0);
                        String formatted =
                            "0:${remaining.toString().padLeft(2, '0')}";
                        return Text(
                          formatted,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff8E8EA9),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 113),
                AppButtom(
                  text: 'Done',
                  onPressed: () {
                    // if (widget.isFromForgotPassword) {
                    //   goTo(CreatPasswordView(), canPop: false);
                    // } else {
                    //   showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return SuccesDialog();
                    //     },
                    //   );
                    // }
                  sendData();
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
