import 'dart:math';

import 'package:cosmetics/core/ui/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBack extends StatelessWidget {

  final double paddingStart;
  const AppBack({super.key,this.paddingStart=0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.only(start:paddingStart ),
      child: GestureDetector(
       onTap: (){
         Navigator.pop(context);
       },
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Color(0xff1010100D).withValues(alpha: .05),
            child: Transform.rotate(
              angle: pi,
              child: AppImage(
                image: 'forward.svg',
                color: Color(0xff101010),
                width: 12.w,
                height: 12.h,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
