import 'package:cosmetics/core/ui/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/logic/items_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width:double.infinity.w,
                    height: 152.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color(0xffECA4C5),
                          Color(0xff434cD6).withValues(alpha: .83),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 4.w,
                          spreadRadius: 0.w,
                          color: Color(0xff00000040).withValues(alpha: .25),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 104).r,
                    child: Center(
                      child: ClipOval(
                        child: AppImage(
                          image:
                              'https://is1-ssl.mzstatic.com/image/thumb/Music112/v4/67/fc/36/67fc364d-0295-636c-2031-e561757e774d/artwork.jpg/1200x630bf-60.jpg',
                          width: 96.w,
                          height: 96.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                'Sara Samer Talaat',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: Color(0xff434C6D),
                ),
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13).r,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: itemProfil.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                         Padding(
                           padding: const EdgeInsets.all(13).r,
                           child: Container(
                              child: Row(
                                children: [
                                  AppImage(image: itemProfil[index].image),
                                  SizedBox(width: 8.w),
                                  Text(
                                    itemProfil[index].text,
                                    style: TextStyle(
                                      color: Color(0xff434C6D),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: AppImage(image: 'forward.svg'),
                                  ),
                                ],
                              ),
                            ),
                         ),

                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13).r,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {},
                    icon: Container(
                      width: 88.w,
                      height: 32.h,
                      child: Row(
                        children: [
                          AppImage(image: 'out.svg',
                          width: 24.w,
                            height: 24.h,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'Logout',
                            style: TextStyle(
                              color: Color(0xffCD0F0F),
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
