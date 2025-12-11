import 'package:cosmetics/core/ui/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtom extends StatelessWidget {
  final bool isLoading;
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final Size? size;
  final String? icon;
  const AppButtom({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.size,
    this.icon,  this.isLoading=false,
  });

  @override
  Widget build(BuildContext context) {
    if(isLoading){
      return Center(child: CircularProgressIndicator(),);
    }

    return ElevatedButton.icon(
      icon: icon != null ? AppImage(image: icon!) : null,
      style: ElevatedButton.styleFrom(
        minimumSize: size,
        backgroundColor: color,
      ),
      onPressed: onPressed,
      label: Text(
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
