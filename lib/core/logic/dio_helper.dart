import 'package:dio/dio.dart';

import 'helper_methods.dart';

class DioHelper {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: 'http://www.cosmatics.growfet.com/',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  static Future<CustomResponce> getData({String path = ""}) async {
    try {
      final resp = await _dio.get(path);
      // final data;
      // if(resp.data is List){
      //   data= {"list":resp.data};
      // }else{
      //   data= resp.data;
      // }

      return CustomResponce(isSuccess: true, data: resp.data);
    } on DioException catch (ex) {
      return CustomResponce(
        isSuccess: false,
        msg: ex.response?.data['message'],
      );
      // ex.response?.data['message']
    }
  }

  static Future<CustomResponce> sedData({
    String path = "",
    Map<String, dynamic>? data,
  }) async {
    try {
      final resp = await _dio.post(path, data: data);
      return CustomResponce(isSuccess: true, data: resp.data);
    } on DioException catch (ex) {
      return CustomResponce(
        isSuccess: false,
        msg: ex.response?.data['message'],
      );
      // ex.response?.data['message']
    }
  }
}

class CustomResponce {
  final bool isSuccess;
  final String? msg;
  final dynamic data;

  CustomResponce({required this.isSuccess, this.msg, this.data});
}
