import 'package:cosmetics/views/auth/creat_password.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:cosmetics/views/auth/forget_password.dart';
import 'package:cosmetics/views/check_out.dart';
import 'package:cosmetics/views/on_boarding.dart';
import 'package:cosmetics/views/splach.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/logic/helper_methods.dart';
import 'moves.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      // splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Color(0xff434C6D),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Color(0xff434C6D), // The color is from above
                // textStyle: TextStyle(color: Color(0xff434C6D), ),
              ),
            ),
            scaffoldBackgroundColor: Color(0xffD9D9D9),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffD75D72),
                minimumSize: Size(268.w, 65.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60.r),
                ),
              ),
            ),
            textTheme: TextTheme(
              labelSmall: TextStyle(
                color: Color(0xff434C6D),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              bodySmall: TextStyle(
                color: Color(0xff8E8EA9),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              bodyLarge: TextStyle(
                color: Color(0xff434C6D),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              labelMedium: TextStyle(
                color: Color(0xff434C6D),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              bodyMedium: TextStyle(
                color: Color(0xff434C6D),
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
              ),
            ),
            appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
                color: Color(0xff434C6D),
              ),
              surfaceTintColor: Colors.transparent,
              backgroundColor: Color(0xffD9D9D9),
            ),
            fontFamily: 'Montserrat',
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(color: Color(0xff8E8EA9), fontSize: 18),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color(0xffB3B3C1)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color(0xffB3B3C1)),
              ),
            ),
          ),
          home: CheckOutView(),
        );
      },
    );
  }
}
