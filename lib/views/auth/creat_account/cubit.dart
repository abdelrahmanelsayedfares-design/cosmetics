import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/helper_methods.dart';
import '../verify/view.dart';

class RegisterCubit extends Cubit<DataState> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text: 'fares');
  final phoneController = TextEditingController(text: '01500079498');
  final passController = TextEditingController(text: 'abdelrahman');
  final confirmPassController = TextEditingController();
  final emailController = TextEditingController(text: 'farahfares011@gmail.com');
  String? selectedCounterCode;
  bool isLoginClicked = false;

  RegisterCubit() : super(DataState.initial);

  Future<void> sendData() async {
    if (selectedCounterCode == null) {
      showMasg('Please select the country code', isError: true);
      return;
    }

    emit(DataState.loading);

    final resp = await DioHelper.sendData(
      'api/Auth/register',
      data: {
        "username": nameController.text.trim(),
        "countryCode": selectedCounterCode,
        "phoneNumber": phoneController.text.trim(),
        "email": emailController.text.trim(),
        "password": passController.text.trim(),
      },
    );

    print('Response Data: ${resp.data}');

    String msg;
    if (resp.data == null) {
      msg = 'Error';
    } else if (resp.data is Map) {
      msg = resp.data['message'] ??
          (resp.data.values.first is List ? resp.data.values.first[0] : resp.data.values.first.toString()) ??
          'Error';
    } else if (resp.data is String) {
      msg = resp.data;
    } else {
      msg = 'Error';
    }

    if (resp.isSuccess) {
      emit(DataState.success);
      showMasg(msg);
      goTo(
        VerifyCodeView(
          isFromForgotPassword: false,
          phoneNumber: phoneController.text.trim(),
          countryCode: selectedCounterCode,
        ),
        canPop: false,
      );
    } else {
      emit(DataState.failed);
      showMasg(msg, isError: true);
    }
  }

  void onChangeFormData() {
    if (isLoginClicked) {
      formKey.currentState!.validate();
    }
  }

  void onCountryCodeChanged(value) {
    selectedCounterCode = value;
  }

  void register() {
    isLoginClicked = true;
    if (formKey.currentState!.validate()) {
      sendData();
    }
  }
}