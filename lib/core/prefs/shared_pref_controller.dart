import 'package:elancer_hackathon/data/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';



enum PrefKeys { loggedIn, lang, fullName, email, gender, phoneNumber, token }

class SharedPrefController {
  static final SharedPrefController _instance = SharedPrefController._();

  SharedPrefController._();

  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance;
  }

  Future<void> initSharedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save({required User user}) async {
    await _sharedPreferences.setBool(PrefKeys.loggedIn.toString(), true);
    await _sharedPreferences.setString(PrefKeys.fullName.toString(), user.name);

    await _sharedPreferences.setString(
        PrefKeys.phoneNumber.toString(), user.mobile);
    await _sharedPreferences.setString(PrefKeys.gender.toString(), user.gender);
    await _sharedPreferences.setString(
        PrefKeys.token.toString(), 'Bearer ' + user.token);
  }

  Future<void> saveEmail({required String email}) async {
    await _sharedPreferences.setString(PrefKeys.email.toString(), email);
  }

  Future<void> updateProfile(
      {required Map<String, String> updateProfileDetails}) async {
    await _sharedPreferences.setString(
        PrefKeys.fullName.toString(), updateProfileDetails['name'] ?? "");

    await _sharedPreferences.setString(
        PrefKeys.gender.toString(), updateProfileDetails['gender'] ?? "");
  }

  String get fullName =>
      _sharedPreferences.getString(PrefKeys.fullName.toString()) ?? '';

  String get email =>
      _sharedPreferences.getString(PrefKeys.email.toString()) ?? '';

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKeys.loggedIn.toString()) ?? false;

  String get token =>
      _sharedPreferences.getString(PrefKeys.token.toString()) ?? '';

  Future<void> setLanguage({required String lang}) async {
    await _sharedPreferences.setString(PrefKeys.lang.toString(), lang);
  }

  String get language =>
      _sharedPreferences.getString(PrefKeys.lang.toString()) ?? 'en';

  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }
}
