import 'package:cosmetics/core/logic/cash_helper.dart';
import 'package:cosmetics/core/logic/dio_helper.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_images.dart';
import 'package:cosmetics/views/auth/login/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../auth/login/model.dart';
part 'components/header.dart';
part 'components/model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData()async{
    final resp = await DioHelper.getData('api/Auth/profile');
    if(resp.isSuccess){
    final model = UserModel.fromJson(resp.data);
    await CacheHelper.saveUserData(model: model);
    setState(() {

    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _Header(),
            SizedBox(height: 10.h),
            Text(
              CacheHelper.name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: Color(0xff434C6D),
              ),
            ),
            SizedBox(height: 40.h),
            _Model(image: 'edit_info.svg', title: 'Edit info'),
            _Model(image: 'order_history.svg', title: 'Order History'),
            _Model(title: 'Wallet', image: 'wallet.svg'),
            _Model(title: 'Settings', image: 'settings.svg'),
            _Model(title: 'Voucher', image: 'voucher.svg'),
          ],
        ),
      ),
    );
  }
}
