import 'package:flutter/material.dart';
import '../../../core/logic/cash_helper.dart';
import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/helper_methods.dart';
import '../../home/views.dart';
import 'model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit <DataState>{
  bool isLoginClicked = false;
  String? selectedCounterCode;
  final phoneController = TextEditingController(text: '01021420526');
  final passController = TextEditingController(text: 'abdelrahman123@');
  final formKey = GlobalKey<FormState>();
  DataState state2 = DataState.initial;
  LoginCubit():super(DataState.initial);
  Future<void> sendData() async {
    state2 = DataState.loading;

    emit(state2);
    final phone = phoneController.text.trim();
    final password = passController.text.trim();
    final resp = await DioHelper.sendData(
      'api/Auth/login',
      data: {
        "countryCode": selectedCounterCode,
        "phoneNumber": phone,
        "password": password,
      },
    );
    if (resp.isSuccess) {
      showMasg('Login success');
      final data = UserData.fromJson(resp.data);
      await CacheHelper.saveUserData(data: data);

      goTo(HomeView(), canPop: false);
    } else {
      state2 = DataState.failed;
      showMasg(resp.msg, isError: true);
    }

    emit(state2);
  }

  void onChangeFormData() {
    if (isLoginClicked) {
      formKey.currentState!.validate();
    }
  }

  void onCountryCodeChanged(value) {
    selectedCounterCode = value;
  }

  void login() {
    isLoginClicked = true;
    if (formKey.currentState!.validate()) {
      sendData();
    }
  }

  bool get isLoading => state == DataState.loading;
}

