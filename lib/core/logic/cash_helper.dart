import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static late SharedPreferences _prefs;
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void SetNotFirstTime() {
    _prefs.setBool('isFirstTime', false);
  }

  static bool get isFirstTime {
   return _prefs.getBool('isFirstTime') ?? true;
  }


  static void SetEmail(String email) {
    _prefs.setString('email', email);
  }

  static String get email {
    return _prefs.getString('email') ?? '';
  }

}
