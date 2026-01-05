import 'dart:core';
import 'dart:ffi';
import 'dart:math';

import 'package:cosmetics/core/logic/dio_helper.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:dio/dio.dart';
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
  List<CounteryModel>? list;

  initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final resp = await DioHelper.getData(path: 'api/Countries');
    if(resp.isSuccess){
      list = CounteriesData.fromJsonList(resp.data).list;
      selectedCounteryCode = list!.first.code;
      widget.onCountryCodeChanged?.call(selectedCounteryCode);
      setState(() {

      });
    }else{
      showMasg(resp.msg,isError: false);
    }
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
        child: list == null
            ? CircularProgressIndicator()
            : DropdownButton(
                dropdownColor: Color(0xffD9D9D9),
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
                items: list!.map((e) {
                  return DropdownMenuItem(
                    value: e.code,
                    child: Text(
                      '${e.code}',
                      style: TextStyle(color: Color(0xff434C6D)),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  selectedCounteryCode = value!;
                  widget.onCountryCodeChanged?.call(selectedCounteryCode);
                  setState(() {});
                },
              ),
      ),
    );
  }
}

class CounteryModel {
  late final int id;
  late final String code, name;

  CounteryModel.fromjson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    code = json['code'] ?? '';
    name = json['name'] ?? '';
  }
}

class CounteriesData {
  late List<CounteryModel> list;

  CounteriesData.fromJsonList(List<dynamic> JsonList) {
    list = JsonList.map((e) => CounteryModel.fromjson(e)).toList();
  }
}
