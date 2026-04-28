import 'dart:core';
import 'package:cosmetics/core/logic/dio_helper.dart';
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
  late String selectedCountryCode;
  late List<CountryModel> list;

  @override
  initState() {
    super.initState();
    getData();
  }

  DataState state = DataState.loading;

  Future<void> getData() async {
    state = DataState.loading;
    setState(() {});
    final resp = await DioHelper.getData('api/Countries');

    if (resp.isSuccess) {
      list = CountriesData.fromJsonList(resp.data).list;
      selectedCountryCode = list!.first.code;
      widget.onCountryCodeChanged?.call(selectedCountryCode);
      widget.onCountryCodeChanged?.call(selectedCountryCode);
      state = DataState.success;
    } else {
      state = DataState.failed;
    }
    setState(() {});
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
        child: state == DataState.failed
            ? IconButton(onPressed: getData, icon: Icon(Icons.replay))
            : state == DataState.loading
            ? Center(child: CircularProgressIndicator())
            : DropdownButton(
                dropdownColor: Color(0xffD9D9D9),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4).r,
                value: selectedCountryCode,
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
                      e.code,
                      style: TextStyle(color: Color(0xff434C6D)),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  selectedCountryCode = value!;
                  widget.onCountryCodeChanged?.call(selectedCountryCode);
                  setState(() {});
                },
              ),
      ),
    );
  }
}

class CountryModel {
  late final int id;
  late final String code, name;

  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    code = json['code'] ?? '';
    name = json['name'] ?? '';
  }
}

class CountriesData {
  late List<CountryModel> list;

  CountriesData.fromJsonList(List<dynamic> jsonList) {
    list = jsonList.map((e) => CountryModel.fromJson(e)).toList();
  }
}
