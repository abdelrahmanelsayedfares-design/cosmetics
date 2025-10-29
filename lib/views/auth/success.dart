import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_images.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/ui/app_buttom.dart';
import '../home/views.dart';

class SuccesDialog extends StatelessWidget {
  final bool isFromCreatePassword;

  const SuccesDialog({
    super.key,
    this.isFromCreatePassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppImage(image: 'success.json', width: 100, height: 100),
          SizedBox(height: 26.h),
          Text(
            isFromCreatePassword ? 'Password Created!' : 'Account Activated!',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: const Color(0xff434C6D),
            ),
          ),
          SizedBox(height: 7.34.h),
          Text(
            isFromCreatePassword
                ? 'Congratulations! Your password\n has been successfully created'
                : 'Congratulations! Your account\n has been successfully activated',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.sp, color: const Color(0xff8E8EA9)),
          ),
          SizedBox(height: 25.h),
          AppButtom(
            text: isFromCreatePassword ? 'Return to login' : 'Go to Home',
            onPressed: () {
              if (isFromCreatePassword) {
                goTo(LoginView(),canPop: false);
              } else {
                goTo(HomeViews(),canPop: false);
              }
            },
          ),
        ],
      ),
    );
  }
}
