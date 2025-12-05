import 'package:cosmetics/core/ui/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity.w,
                  height: 152.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: AlignmentDirectional.bottomCenter,
                      end: AlignmentDirectional.topCenter,
                      colors: [
                        Color(0xffECA4C5),
                        Color(0xff434C6DD4).withValues(alpha: .83),
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
                    child: AppImage(
                      isCircle: true,
                      image:
                          'https://is1-ssl.mzstatic.com/image/thumb/Music112/v4/67/fc/36/67fc364d-0295-636c-2031-e561757e774d/artwork.jpg/1200x630bf-60.jpg',
                      width: 96.w,
                      height: 96.h,
                      fit: BoxFit.cover,
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
            _Model(image: 'edit_info.svg', title: 'Edit info',onTap: (){}),
            _Model(image: 'order_history.svg', title: 'Order History',onTap: (){}),
            _Model(title: 'Wallet', image: 'wallet.svg',onTap: (){}),
            _Model(title: 'Settings', image: 'setting.svg',onTap: (){}),
            _Model(title: 'Voucher ', image: 'voucher.svg',onTap: (){}),
            _Model(title: 'Logout ', image: 'log_out.svg',onTap: (){},isLogout: true,),
          ],
        ),
      ),
    );
  }
}

class _Model extends StatelessWidget {
  final String image,title;
  final Function? onTap;
  final bool isLogout;
  const _Model({super.key, required this.image, required this.title, this.onTap,  this.isLogout=false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){},
      leading: AppImage(image: image),
      title: Text(title,style: TextStyle(color: isLogout?Color(0xffCD0F0F):null)),
      trailing:isLogout?null: AppImage(image: 'vector.svg'),
    );
  }
}

