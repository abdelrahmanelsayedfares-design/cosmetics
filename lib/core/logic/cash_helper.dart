import 'package:cosmetics/views/auth/login/view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../views/auth/login/model.dart';

class CacheHelper {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void setNotFirstTime() {
    _prefs.setBool('isFirstTime', false);
  }

  static bool get isFirstTime {
    return _prefs.getBool('isFirstTime') ?? true;
  }

  static void setEmail(String email) {
    _prefs.setString('email', email);
  }

  static String get email {
    return _prefs.getString('email') ?? '';
  }

  static String get name {
    return _prefs.getString('username') ?? 'Abdelrahman Talkhan';
  }

  static String get image {
    var image = _prefs.getString('profilePhotoUrl');
    if (image == null || image.isEmpty) {}
    image =
    'https://scontent.fcai19-1.fna.fbcdn.net/v/t39.30808-6/476093727_1549175459079215_6173101870672001612_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=833d8c&_nc_ohc=X0yCbv3ETCQQ7kNvwGLy6IN&_nc_oc=AdnkV4t3VzLhnExDSqwZu8r2xHKvVNay9F5TgG5gniAWVSBfnTXHQZ29Lyo8ff55PCA&_nc_zt=23&_nc_ht=scontent.fcai19-1.fna&_nc_gid=zPoVxh2WPDPerOx6m6oh7w&oh=00_AftIRse6zYNk1QB6HF2kOd5TEkPcusT_tLJqIjshAZ5WQQ&oe=698D3903';

    return image;
  }

  static bool get isAuth {
    return token.isNotEmpty;
  }

  static String get token {
    return _prefs.getString('token') ?? '';
  }

  static Future<void> logout() async {
    await _prefs.remove('token');
    await _prefs.remove('id');
    await _prefs.remove('username');
    await _prefs.remove('phoneNumber');
    await _prefs.remove('countryCode');
    await _prefs.remove('profilePhotoUrl');
    await _prefs.remove('role');
    await _prefs.remove('email');
  }

  static Future<void> saveUserData({UserData? data, UserModel? model}) async {
    if (data == null && model == null) return;
    if (data != null) {
      _prefs.setString('token', data.token);
      model = data.user;
    }
    if (model != null) {
      _prefs.setInt('id', model.id);
      _prefs.setString('username', model.username);
      _prefs.setString('phoneNumber', model.phoneNumber);
      _prefs.setString('countryCode', model.countryCode);
      _prefs.setString('profilePhotoUrl', model.profilePhotoUrl);
      _prefs.setString('role', model.role);
      _prefs.setString('email', model.email);
    }

    // setEmail(model.user.email);
  }
}