import 'package:cosmetics/core/ui/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/logic/dio_helper.dart';
import '../../../../core/logic/helper_methods.dart';
import '../../../check_out.dart';
part 'components/app_list_view_cart.dart';

class MyCartPageView extends StatefulWidget {
  const MyCartPageView({super.key});

  @override
  State<MyCartPageView> createState() => _MyCartPageViewState();
}

class _MyCartPageViewState extends State<MyCartPageView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // refresh cart
    });
  }

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
                goTo(CheckOutView(), canPop: true);
              },
              icon: AppImage(image: 'shopping.svg'),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
              AppListViewCart(),
            ],
          ),
        ),
      ),
    );
  }
}

