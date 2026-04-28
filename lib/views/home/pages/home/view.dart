import 'dart:convert';
import 'dart:ffi';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cosmetics/core/logic/dio_helper.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_images.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/ui/app_input.dart';
part 'components/offers.dart';
part 'components/list.dart';
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
                labelText: 'Search',
                TextInputTypee: TextInputType.text,
                image: 'search.svg',
              ),
              SizedBox(height: 12.39.h),
              _Offers(),
              SizedBox(height: 26.h),
              _List(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final ProductModel model;
  const _Item({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 237.h,
      width: 176.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xffD9D9D9),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            spreadRadius: 0,
            blurRadius: 10,
            color: Color(0xff00000040).withValues(alpha: .25),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  AppImage(image: model.image, width: 161.w, height: 169.h),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, right: 6).r,
                    child: InkWell(
                      onTap: () async {
                        final resp = await DioHelper.sendData(
                          'api/Cart/add?productId=${model.id}&quantity=1',
                        );

                        if (resp.isSuccess) {
                          showMasg('Added to cart');
                        } else {
                          showMasg(resp.msg, isError: true);
                        }
                      },
                      child: Container(
                        width: 32.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusGeometry.circular(8),
                          color: Color(0xffFFFAFA),
                        ),
                        child: Center(
                          child: AppImage(
                            image: 'market.svg',
                            width: 16,
                            height: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 11.h),
            Text(
              model.name_en,
              style: TextStyle(
                color: Color(0xff434C6D),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 11.h),
            Text(
              '\$${model.price}',
              style: TextStyle(
                color: Color(0xff70839C),
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
