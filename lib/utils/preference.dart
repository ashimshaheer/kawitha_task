import 'package:shared_preferences/shared_preferences.dart';

class AppPref {
  static const _userToken = "accessToken";
  static const _isSignedIn = 'isSignedIn';

  static const String _country = 'country';
  static const String _refreshToken = 'refreshToken';
  static const String _username = 'username';
  static const String _email = 'email';
  static const String _firstName = 'firstName';
  static const String _lastName = 'lastName';
  static const String _gender = 'gender';
  static const String _image = 'image';

  static late SharedPreferences _preference;

  //country
  static String get country => _preference.getString(_country) ?? "";

  static set country(String value) => _preference.setString(_country, value);

  // Flicks Downloadable

  //User Is SignedIn or not
  static bool get isSignedIn => _preference.getBool(_isSignedIn) ?? false;

  static set isSignedIn(bool value) => _preference.setBool(_isSignedIn, value);
  //FCM Token
  static String get refreshToken => _preference.getString(_refreshToken) ?? "";

  static set refreshToken(String value) => _preference.setString(_refreshToken, value);
  //User Token _userProfileId
  static String get userToken => _preference.getString(_userToken) ?? "";
  static set userToken(String value) => _preference.setString(_userToken, value);
  Future<void> clear() async {
    await _preference.clear();
  }

  void reloadPreference() async {
    await _preference.reload();
  }

  static Future<void> init() async {
    _preference = await SharedPreferences.getInstance();
  }
}
