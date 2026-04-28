import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/helper_methods.dart';
import '../verify/view.dart';

class ForgetPasswordCubit extends Cubit<DataState> {
  ForgetPasswordCubit() : super(DataState.initial);
  final phoneController = TextEditingController();
  String? selectedCounterCode;
  final formKey = GlobalKey<FormState>();
  bool isLoginClicked = false;
  bool isLoading = false;
  DataState? state2;

  Future<void> sendData() async {

    emit(DataState.loading);

    final resp = await DioHelper.sendData(
      'api/Auth/forgot-password',
      data: {
        "countryCode": selectedCounterCode,
        "phoneNumber": phoneController.text.trim(),
      },
    );

    final msg = resp.data != null && resp.data is Map
        ? resp.data['message'] ?? 'Error'
        : 'Error';
    if (resp.isSuccess) {
      emit(DataState.success);
      // state2 = DataState.success;
      showMasg(msg);
      goTo(
        VerifyCodeView(
          phoneNumber: phoneController.text.trim(),
          countryCode: selectedCounterCode,
          isFromForgotPassword: true,
        ),
        canPop: true,
      );
    } else {
      emit(DataState.failed);
      showMasg(msg, isError: true);
    }

  }

  void onChangedForm() {
    if (isLoginClicked) {
      formKey.currentState!.validate();
    }
  }
  void onCountryCodeChanged(value) {
    selectedCounterCode = value;
  }
  void next() async {
    isLoginClicked = true;

    if (!formKey.currentState!.validate()) return;

    final code = selectedCounterCode;

    if (code == null) {
      showMasg('Select country code', isError: true);
      return;
    }

    isLoading = true;
    await sendData();
    isLoading = false;
  }
  bool get isLooding =>  state == DataState.loading;
}
