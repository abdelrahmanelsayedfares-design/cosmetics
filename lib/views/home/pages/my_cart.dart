import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/ui/list_view_cart.dart';
import '../../check_out.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('My Cart', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24).r,
            child: IconButton(
              onPressed: () {
               goTo(CheckOutView(),canPop: true);
              },
              icon: AppImage(image: 'shopping.svg'),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You have 4 products in your cart',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Color(0xff434C6D8C).withValues(alpha: .55),
                ),
              ),
              SizedBox(height: 34.h),
              ListViewCart(),
            ],
          ),
        ),
      ),
    );
  }
}
