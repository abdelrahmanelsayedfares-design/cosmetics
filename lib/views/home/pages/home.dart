import 'package:cosmetics/core/ui/app_images.dart';
import 'package:cosmetics/core/ui/grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/ui/app_input.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(13.0).copyWith(bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppInput(
                borderRadius: 24.w,
                suffixImage: 'search.svg',
                // borderRadius: 24.w,
                labelText: 'Search',
                TextInputTypee: TextInputType.text,
                image: 'search.svg',
              ),
              SizedBox(height: 12.39),
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(20),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AppImage(
                      image:
                          'https://img.buzzfeed.com/buzzfeed-static/static/2019-08/16/2/asset/2f2486d35771/sub-buzz-2247-1565922471-1.jpg',
                      height: 320.h,
                      width: double.infinity,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20).r,
                      // color: Colors.red,
                      color: Color(0xffE9DCD3).withValues(alpha: .8),
                      width: 364.w,
                      height: 151.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '50% OFF DISCOUNT \n CUPON CODE : 125865',
                                  style: TextStyle(
                                    color: Color(0xff68372E),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                              AppImage(image: 'offer.svg'),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            children: [
                              AppImage(image: 'offer.svg'),
                              Spacer(),
                              Text(
                                'Hurry up!\n Skin care only !',
                                style: TextStyle(
                                  color: Color(0xff434C6D),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 26.h),
              Text(
                'Top rated products',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff434C6D),
                ),
              ),
              SizedBox(height: 14.h),
              GridVieww(),
            ],
          ),
        ),
      ),
    );
  }
}
