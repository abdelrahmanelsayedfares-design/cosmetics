import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void goTo(Widget page, {bool canPop = true, int? delayInSeconds}) {
  void action() {
    Navigator.pushAndRemoveUntil(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (context) => page),
      (route) => canPop,
    );
  }

  if (delayInSeconds != null) {
    Timer(Duration(seconds: delayInSeconds), () {
      action();
    });
  } else {
    action();
  }
}

void showMasg(String? msg, {bool isError = false}) {
  if (msg != null && msg.isNotEmpty) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        backgroundColor: isError ? Colors.red : Colors.green,
        content: Text(
          msg,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        duration: Duration(seconds: 2),
        // Text('الرجاء تفعيل خدمه الوصول الي الموقع')
      ),
    );
  }
}
