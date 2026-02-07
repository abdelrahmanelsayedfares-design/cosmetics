import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/helper_methods.dart';

class VerifyCubit extends Cubit<DataState> {
  final String phoneNumber;
  final String countryCode;
  final bool isFromForgotPassword;

  VerifyCubit({
    required this.phoneNumber,
    required this.countryCode,
    required this.isFromForgotPassword,
  }) : super(DataState.initial);

  final otp = TextEditingController();

  Future<void> sendData() async {
    try {
      emit(DataState.loading);

      final oTp = otp.text.trim();

      final resp = await DioHelper.sendData(
        'api/Auth/verify-otp',
        data: {
          "countryCode": countryCode,
          "phoneNumber": phoneNumber,
          "otpCode": oTp,
        },
      );

      showMasg(resp.msg);

      if (resp.isSuccess) {
        emit(DataState.success);
      } else {
        emit(DataState.failed);
      }
    } catch (e) {
      emit(DataState.failed);
      showMasg('Error', isError: true);
    }
  }
}
