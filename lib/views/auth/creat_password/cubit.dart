import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/helper_methods.dart';

class CreatePasswordCubit extends Cubit<DataState> {
  final String phoneNumber;
  final String countryCode;

  CreatePasswordCubit({required this.phoneNumber, required this.countryCode})
    : super(DataState.initial);

  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  Future<void> sendData() async {
    emit(DataState.loading);

    final resp = await DioHelper.sendData(
      'api/Auth/reset-password',
      data: {
        "countryCode": countryCode,
        "phoneNumber": phoneNumber,
        "newPassword": password.text.trim(),
        "confirmPassword": confirmPassword.text.trim(),
      },
    );

    final msg = resp.data != null && resp.data is Map
        ? resp.data['message'] ?? 'Error'
        : 'Error';

    if (resp.isSuccess) {
      emit(DataState.success);
      showMasg(msg);
    } else {
      emit(DataState.failed);
      showMasg(msg, isError: true);
    }
  }

  @override
  Future<void> close() {
    password.dispose();
    confirmPassword.dispose();
    return super.close();
  }

  void confirm() {
    if (password.text.isEmpty || confirmPassword.text.isEmpty) {
      showMasg('Enter password', isError: true);
      return;
    }

    if (password.text != confirmPassword.text) {
      showMasg('Passwords do not match', isError: true);
      return;
    }

    sendData();
  }
  bool get isLoading => state == DataState.loading;
}
