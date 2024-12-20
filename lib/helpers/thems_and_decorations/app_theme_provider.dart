import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/api_get_app_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/card_decoration_theme.dart';
import 'package:iem_app/utilites/shared_preferences/shared_preferances.dart';
import 'package:iem_app/widgets/app_config_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemeProvider extends ChangeNotifier{
  bool _isWaiting = false;
  bool get isWaiting => _isWaiting;
  late bool themeIsDarkMode = SharedPref.isThemeIsDarkMode();
  SystemUiOverlayStyle statusBarStyle = const SystemUiOverlayStyle();

  late final ThemeMode _mode = SharedPref.isThemeIsDarkMode() ? ThemeMode.dark : ThemeMode.light;
  ThemeMode get theMode => _mode;

  late AppConfigModel appThemeColor;

  TextTheme textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: SizeConfig.headline1Size,
      fontWeight: FontWeight.w600,
    ), //28px
    // titleMedium: TextStyle(fontSize: SizeConfig.headline1Size, fontWeight: FontWeight.normal,),//26px

    headlineMedium: TextStyle(
      fontSize: SizeConfig.headline2Size,
      fontWeight: FontWeight.w600,
    ),

    headlineSmall: TextStyle(
      fontSize: SizeConfig.headline2Size,
      fontWeight: FontWeight.w500,
    ),  //18px

    titleMedium: TextStyle(
      fontSize: SizeConfig.headline3Size,
      fontWeight: FontWeight.w500,
    ), //16px

    bodyMedium: TextStyle(
      fontSize: SizeConfig.headline3Size,
      fontWeight: FontWeight.w400,
    ), //16px

    labelLarge: TextStyle(
      fontSize: SizeConfig.headline4Size,
      fontWeight: FontWeight.w400,
    ), //14

    titleSmall: TextStyle(
      fontSize: SizeConfig.headline4Size,
      fontWeight: FontWeight.w500,
    ),//14px reg

    labelMedium: TextStyle(
      fontSize: SizeConfig.headline5Size,
      fontWeight: FontWeight.w400,
    ), //12px,


    labelSmall: TextStyle(
    fontSize: SizeConfig.headline6Size,
    fontWeight: FontWeight.w400,
  ),//10


  );

  statusBarTheme() async {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    if (themeIsDarkMode) {
      statusBarStyle = SystemUiOverlayStyle(
        /// top status bar icon for ios color
        statusBarBrightness: Brightness.light,

        ///top status bar icon for android color
        statusBarIconBrightness: Brightness.dark,

        /// bottom bar button icon for android color
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: SharedPref.isThemeIsDarkMode()
            ? CardsDecorationThemeConfig.statusBarColorDark
            : CardsDecorationThemeConfig.statusBarColorLight,
      );
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          /// top status bar icon for ios color
          statusBarBrightness: Brightness.light,

          ///top status bar icon for android color
          statusBarIconBrightness: Brightness.dark,

          /// bottom bar button icon for android color
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarColor: SharedPref.isThemeIsDarkMode()
              ? CardsDecorationThemeConfig.statusBarColorDark
              : CardsDecorationThemeConfig.statusBarColorLight,
        ),
      );
    } else {
      statusBarStyle = SystemUiOverlayStyle(
        /// top status bar icon for ios color
        statusBarBrightness: Brightness.dark,

        ///top status bar icon for android color
        statusBarIconBrightness: Brightness.light,

        /// bottom bar button icon for android color
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: SharedPref.isThemeIsDarkMode()
            ? CardsDecorationThemeConfig.statusBarColorDark
            : CardsDecorationThemeConfig.statusBarColorLight,
      );
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          /// top status bar icon for ios color
          statusBarBrightness: Brightness.dark,

          ///top status bar icon for android color
          statusBarIconBrightness: Brightness.light,

          /// bottom bar button icon for android color
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: SharedPref.isThemeIsDarkMode()
              ? CardsDecorationThemeConfig.statusBarColorDark
              : CardsDecorationThemeConfig.statusBarColorLight,
        ),
      );
    }
    notifyListeners();
  }

  setThemeIsDarkMode({required bool darkMode}) {
    // themeIsDarkMode=darkMode;
    // UserDataFromStorage.setThemeIsDarkMode(darkMode);
    // notifyListeners();
    //
    // if(themeIsDarkMode){
    //   _mode=ThemeMode.dark;
    // }
    // else{
    //   _mode=ThemeMode.light;
    // }
    // notifyListeners();
    statusBarTheme();
  }

  Future getAppConfigResponse() async {
    _isWaiting = true;
    notifyListeners();
    appThemeColor = await AppConfigResponse().getAppConfigResponse();
    _isWaiting = false;
    notifyListeners();
  }

  listen() {
    notifyListeners();
  }
}
