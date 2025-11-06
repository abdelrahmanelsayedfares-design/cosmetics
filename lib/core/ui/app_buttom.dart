import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppButtom extends StatelessWidget {

  final String text;
  final VoidCallback? onPressed ;
  final ButtonStyle? style;
  const AppButtom({super.key, required this.text,required this.onPressed, this.style,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
