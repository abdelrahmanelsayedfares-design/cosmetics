import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_images.dart';

class AppCounterCode extends StatefulWidget {
  final ValueChanged<String>? onCountryCodeChanged;
  const AppCounterCode({super.key, this.onCountryCodeChanged});

  @override
  State<AppCounterCode> createState() => _AppCounterCodeState();
}

class _AppCounterCodeState extends State<AppCounterCode> {
  late String selectedCounteryCode;
  final List = ['20', '30', '40', '50'];
  initState() {
    super.initState();
    selectedCounteryCode = List.first;
    widget.onCountryCodeChanged?.call(selectedCounteryCode);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 6.w),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(
              context,
            ).inputDecorationTheme.enabledBorder!.borderSide.color,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: DropdownButton(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4).r,
          value: selectedCounteryCode,
          icon: Padding(
            padding: const EdgeInsetsDirectional.only(start: 6),
            child: AppImage(
              image: 'down.svg',
              width: 8.212553024291992.w,
              height: 3.0836985111236572.h,
            ),
          ),
          items: List.map((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(
                '+${e.toString()}',
                style: TextStyle(color: Color(0xff434C6D)),
              ),
            );
          }).toList(),
          onChanged: (value) {
            selectedCounteryCode = value!;
            // if(widget.onCountryCodeChanged!=null){
            //   widget.onCountryCodeChanged!(selectedCounteryCode);
            //
            // }
            widget.onCountryCodeChanged?.call(selectedCounteryCode);
            setState(() {});
          },
        ),
      ),
    );
  }
}
