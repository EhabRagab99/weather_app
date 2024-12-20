import 'package:iem_app/utilites/shared_preferences/shared_preferances.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
enum Languages { ar, en }

class LocalizationProvider extends ChangeNotifier {
  Locale? _appLocale;
  // = Locale('ar', '');
  Locale get appLocal => _appLocale ?? const Locale('en', '');


  listen(){
    notifyListeners();
  }

  // Locale fetchLocalization() {
  //   if (SharedPref.getCurrentLang() != null) {
  //     _appLocale = Locale(SharedPref.getCurrentLang()!);
  //     notifyListeners();
  //   } else {
  //     _appLocale = Locale(Languages.ar.name);
  //     notifyListeners();
  //   }
  //   return _appLocale!;
  // }

  fetchLocalization() async {
    // await SharedObj().init();
    // await SharedPref.getData();
    _appLocale = Locale(SharedPref.getCurrentLang() ?? "en");
    if (SharedPref.getCurrentLang() == 'ar') {
      _appLocale = const Locale("ar");
      // notifyListeners();
      // changeLanguage(languageCode: "ar");
      if (kDebugMode) {
        print('lang ....... ${SharedPref.getCurrentLang()}');
      }
      return null;
    }else {
      _appLocale = const Locale("en");
      // notifyListeners();

      // changeLanguage(languageCode: "en");

    }
    if (kDebugMode) {
      print('i have old lang ===${_appLocale.toString()}');
    }
    return null;
  }

  Future changeLanguage({required String languageCode,}) async {
    _appLocale =  Locale(languageCode);
    SharedPref.setCurrentLang(lang:  _appLocale?.languageCode ?? 'en');
    if (kDebugMode) {
      print('language after ...... changed to  ${_appLocale.toString()}');
    }
    notifyListeners();
  }


}
