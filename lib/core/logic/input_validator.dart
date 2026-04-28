class InputValidator {
  static String? phoneValidator(String? value) {
    if (value!.isEmpty) {
      return 'phone Must be Not Empty';
    } else if (value.length < 10) {
      return 'phone Must be 10 Digits';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'password Must be Not Empty';
    } else if (value.length < 6) {
      return 'password Must be 6 Digits';
    }
    return null;
  }
}
