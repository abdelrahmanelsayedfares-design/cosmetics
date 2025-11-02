import 'package:cosmetics/core/ui/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/item_cateories.dart';
import '../../../core/ui/app_input.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Categories')),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 24, left: 13, right: 13).r,
            child: Column(
              children: [
                AppInput(
                  borderRadius: 24.w,
                  suffixImage: 'search.svg',
                  labelText: 'Search',
                  TextInputTypee: TextInputType.text,
                  image: 'search.svg',
                  // borderRadius: 24.w,

                ),
                SizedBox(height: 32),
                ListView.separated(
                  padding: EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 30,
                  ).copyWith(bottom: 100).r,
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20).r,
                    child: Divider(color: Color(0xffB3B3C180)),
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: itemCategories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(10),
                            child: AppImage(
                              image: itemCategories[index].image,
                              width: 64.w,
                              height: 69.h,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            itemCategories[index].text,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xff434C6D),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          AppImage(image: 'forward.svg'),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
