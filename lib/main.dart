import 'package:cosmetics/views/home/views.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color(0xff434C6D),
          ),
          surfaceTintColor: Colors.transparent,
          backgroundColor: Color(0xffD9D9D9),
        ),
        fontFamily: 'Montserrat',
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25)
          ),
        ),
        scaffoldBackgroundColor: Color(0xffD9D9D9),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeViews(),
    );
  }
}
