import 'package:iem_app/utilites/shared_preferences/shared_obj.dart';


class SharedPref {
  static const String _userObj = "userObj";
  static const String _fcmToken = "fcmToken";
  static const String _language = "language_code";
  static const String _deviceId = "device_id";
  static const String _intro = "intro";
  // static const String _selectedLanguage = "selectedLanguage";
  static const String _userType = "userType";
  static const String _themeIsDarkMode = "themeIsDarkMode";

  static const String _userOtpResendCount = "userOtpResendCount";


  static Future<void> saveFcmToken({required String? fcmToken}) async {
     await SharedObj().prefs?.setString(_fcmToken, fcmToken ?? '');
  }



  static Future<void> setThemeIsDarkMode() async{
    await SharedObj().prefs?.setBool(_themeIsDarkMode, true);
  }

  static bool isThemeIsDarkMode() {
    return SharedObj().prefs?.getBool(_themeIsDarkMode) ?? false;
  }

  static bool isUserLogIn() {
    return SharedObj().prefs?.getString(_userObj) != null;
  }

  static Future<void> logOut() async {
    await SharedObj().prefs?.remove(_userObj);
    await setUserType(userType: "null");
  }

  static String? getCurrentLang() {
    return SharedObj().prefs?.getString(_language);
  }

  static Future<void> setCurrentLang({required String lang}) async {
    await SharedObj().prefs?.setString(_language, lang);
  }


  // saving Device Id
  static Future<void> setDeviceID({required String deviceID}) async {
    await SharedObj().prefs?.setString(_deviceId, deviceID);
  }

  // getting Device Id
  static String? getDeviceID() {
    return SharedObj().prefs?.getString(_deviceId);
  }

  static Future<void> saveWatchIntro() async {
    await SharedObj().prefs?.setBool(_intro, true);
  }

  static bool isWatchIntro() {
    return SharedObj().prefs?.getBool(_intro) ?? false;
  }


  // static setAppLanguageCode(String value) async{
  //   languageCodeFromStorage = value;
  //   await SharedObj().prefs?.setString("languageCodeFromStorage", languageCodeFromStorage ?? 'ar');
  //
  // }


  // static setAppLanguageId(int value)async {
  //   languageIdFromStorage = value;
  //   await SharedObj().prefs?.setInt("languageIdFromStorage", languageIdFromStorage);
  // }
  // static Future<void> saveSelectedLanguage() async {
  //   await SharedObj().prefs?.setBool(_selectedLanguage, true);
  // }
  //
  // static bool isSelectedLanguage() {
  //   return SharedObj().prefs?.getBool(_selectedLanguage) ?? false;
  // }


  static String? getUserType() {
    String? userType = SharedObj().prefs?.getString(_userType);
    if (userType == "null") {
      return "null";
    }
    return SharedObj().prefs?.getString(_userType);
  }

  static String? getFcmToken() {
    String? fcmToken = SharedObj().prefs?.getString(_fcmToken);
    if (fcmToken == "null") {
      return "null";
    }
    return SharedObj().prefs?.getString(_fcmToken);
  }

  static Future<void> setUserType({required String? userType}) async {
      await SharedObj().prefs?.setString(_userType, userType ?? "null");
  }

  // saving Device Id
  static Future<void> setOtpResendCount({required int count}) async {
    await SharedObj().prefs?.setInt(_userOtpResendCount, count);
  }

  // getting Device Id
  static int? getOtpResendCount() {
    return SharedObj().prefs?.getInt(_userOtpResendCount);
  }

}
