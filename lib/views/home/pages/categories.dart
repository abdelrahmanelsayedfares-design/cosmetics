import 'package:cosmetics/core/ui/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/ui/app_input.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});

  List<_ItemCategories> itemCategories = [
    _ItemCategories(
      image:
          'https://i.pinimg.com/474x/25/77/cf/2577cf3562eb31e6326c024a7066259a.jpg',
      text: 'Bundles',
    ),
    _ItemCategories(
      image:
          'https://i.pinimg.com/550x/df/c2/b4/dfc2b4965f7657f2bc9ec74acb11a6c7.jpg',
      text: 'Perfumes',
    ),
    _ItemCategories(
      image: 'https://cdn.wconcept.com/products/7202026/08/720202608_1.jpg',
      text: 'Makeup',
    ),
    _ItemCategories(
      image:
          'https://i.pinimg.com/736x/7f/57/77/7f5777d531d8fe417c5c3342fe5a2b33.jpg',
      text: 'Skin Care',
    ),
    _ItemCategories(
      image:
          'https://i.pinimg.com/736x/5a/2a/51/5a2a518ec2620e980e24a0593b3d6754.jpg',
      text: 'Gifts',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Categories')),
      ),
      body: SingleChildScrollView(
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
              ),
              SizedBox(height: 32),
              ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 31,
                ).copyWith(bottom: 100).r,
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20).r,
                  child: Divider(color: Color(0xffB3B3C180)),
                ),
                physics: BouncingScrollPhysics(),
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
    );
  }
}

class _ItemCategories {
  final String image;
  final String text;

  _ItemCategories({required this.image, required this.text});
}
