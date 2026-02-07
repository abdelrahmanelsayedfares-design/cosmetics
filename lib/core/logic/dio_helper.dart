import 'package:cosmetics/core/logic/cash_helper.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/views/auth/login/view.dart';
import 'package:dio/dio.dart';

enum DataState { initial,loading, failed, success }

class DioHelper {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://cosmatics.growfet.com/',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  static Future<CustomResponse> sendData(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    // _dio.options.headers.addAll({'Authorization': 'Bearer $token'});
    _dio.options.headers.addAll({
      'Authorization': 'Bearer ${CacheHelper.token}',
    });
    print('AbdoFares');
    print(_dio.options.headers);
    try {
      final resp = await _dio.post(path, data: data);
      // print(resp.data['message']);
      if (resp.statusCode == 200) {
        return CustomResponse(isSuccess: true, data: resp.data);
      }
      return CustomResponse(isSuccess: false, data: resp.data);
    } on DioException catch (ex) {
      final errorData = ex.response?.data;

      print('Error Data: $errorData');

      if (errorData is Map) {
        if (errorData['message'] != null) {
          print(errorData['message']);
        } else if (errorData.isNotEmpty) {
          final firstValue = errorData.values.first;

          if (firstValue is List && firstValue.isNotEmpty) {
            print(firstValue[0]);
          } else {
            print(firstValue.toString());
          }
        }
      } else if (errorData is String) {
        print(errorData); // 👈 زي "Phone Number already exists."
      }

      if (ex.response?.statusCode == 401) {
        CacheHelper.logout();
        goTo(LoginView(), canPop: false);
      }

      return CustomResponse(isSuccess: false, data: errorData);
    }
  }

  static Future<CustomResponse> getData(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    // _dio.options.headers.addAll({'Authorization': 'Bearer $token'});
    _dio.options.headers.addAll({
      'Authorization': 'Bearer ${CacheHelper.token}',
    });

    try {
      final resp = await _dio.get(path, queryParameters: queryParameters);
      // print(resp.data['message']);
      if (resp.statusCode == 200) {
        return CustomResponse(isSuccess: true, data: resp.data);
      }
      return CustomResponse(isSuccess: false, data: resp.data);
    } on DioException catch (ex) {
      if (ex.response?.data != null && ex.response?.data is Map) {
        print(ex.response?.data['message']);
      }
      if (ex.response?.statusCode == 401) {
        CacheHelper.logout();
        goTo(LoginView(), canPop: false);
      }
      return CustomResponse(isSuccess: false, data: ex.response?.data);
    }
  }
  static Future<CustomResponse> deleteData(String path) async {
    _dio.options.headers.addAll({
      'Authorization': 'Bearer ${CacheHelper.token}',
    });

    try {
      final resp = await _dio.delete(path);

      print(resp.data);

      return CustomResponse(isSuccess: true, data: resp.data);
    } catch (e) {
      print(e);
      return CustomResponse(isSuccess: false, data: null);
    }
  }
}

class CustomResponse {
  final bool isSuccess;
  final dynamic data;
  late final String msg;

  CustomResponse({required this.isSuccess, this.data}) {
    if (data == null) {
      msg = 'Error';

    } else if (data is Map<String, dynamic>) {
      msg = data['message']?.toString() ??
          data.values.first.toString();

    } else if (data is String) {
      msg = data;

    } else {
      msg = data.toString();
    }
  }
}