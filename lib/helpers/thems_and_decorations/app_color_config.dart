import 'dart:ui';
import 'package:iem_app/helpers/thems_and_decorations/app_theme_provider.dart';
import 'package:iem_app/provider/public_providers.dart';
import 'package:iem_app/utilites/shared_preferences/shared_preferances.dart';

class ColorConfig {
  static final ColorConfig controller = ColorConfig._internal();
  factory ColorConfig() {
    return controller;
  }
  ColorConfig._internal();

  static AppThemeProvider appThemeColor = PublicProviders.appThemeProvider;

  //#region app bar Background  colors
  Color appbarBackgroundColor(double opacity) {
    try {
      return Color(int.parse((SharedPref.isThemeIsDarkMode() ? appThemeColor.appThemeColor.colors.darkMode.appBar.appbarBackground : appThemeColor.appThemeColor.colors.lightMode.appBar.appbarBackground).replaceAll("#", "0xFF"))).withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFFFFFFF).withOpacity(opacity);
    }
  }

//#endregion

  //#region app Primary colors
  Color primaryColor(double opacity) {
    try {
      return Color(int.parse((SharedPref.isThemeIsDarkMode() ? appThemeColor.appThemeColor.colors.darkMode.primaryAndScaffold.primaryColor : appThemeColor.appThemeColor.colors.lightMode.primaryAndScaffold.primaryColor).replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFF9B0F18).withOpacity(opacity);
    }
  }

  Color secondaryColor(double opacity) {
    try {
      return Color(int.parse((SharedPref.isThemeIsDarkMode() ? appThemeColor.appThemeColor.colors.darkMode.primaryAndScaffold.secondaryColor : appThemeColor.appThemeColor.colors.lightMode.primaryAndScaffold.secondaryColor).replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFF333949).withOpacity(opacity);
    }
  }

//#endregion

  //#region Scaffold Background colors
  Color scaffoldBackgroundColor(double opacity) {
    try {
      return Color(int.parse((SharedPref.isThemeIsDarkMode()
                  ? appThemeColor.appThemeColor.colors.darkMode
                      .primaryAndScaffold.scaffoldBackgroundColor
                  : appThemeColor.appThemeColor.colors.lightMode
                      .primaryAndScaffold.scaffoldBackgroundColor)
              .replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFAFAFAFF).withOpacity(opacity);
    }
  }

//#endregion

  //#region appDivider colors
  Color dividerColor(double opacity) {
    try {
      return Color(int.parse((SharedPref.isThemeIsDarkMode() ? appThemeColor.appThemeColor.colors.darkMode.divider.dividerColor : appThemeColor.appThemeColor.colors.lightMode.divider.dividerColor).replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFBCBCBC).withOpacity(opacity);
    }
  }

//#endregion

  Color whiteColor(double opacity) {
    try {
      return Color(int.parse((SharedPref.isThemeIsDarkMode()
                  ? appThemeColor.appThemeColor.colors.darkMode.theme.whiteColor
                  : appThemeColor
                      .appThemeColor.colors.lightMode.theme.whiteColor)
              .replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFFFFFFF).withOpacity(opacity);
    }
  }

  //#region app Fonts colors
  Color blackColor(double opacity) {
    try {
      return Color(int.parse((SharedPref.isThemeIsDarkMode()
                  ? appThemeColor.appThemeColor.colors.darkMode.theme.blackColor
                  : appThemeColor
                      .appThemeColor.colors.lightMode.theme.blackColor)
              .replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFF000000).withOpacity(opacity);
    }
  }

  Color redColor(double opacity) {
    try {
      return Color(int.parse((SharedPref.isThemeIsDarkMode() ? appThemeColor.appThemeColor.colors.darkMode.theme.redColor : appThemeColor.appThemeColor.colors.lightMode.theme.redColor).replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFF83434).withOpacity(opacity);
    }
  }

  ///0xFFBCBCBC
  Color greyColor(double opacity) {
    try {
      return Color(int.parse((SharedPref.isThemeIsDarkMode() ? appThemeColor.appThemeColor.colors.darkMode.theme.greyColor : appThemeColor.appThemeColor.colors.lightMode.theme.greyColor).replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFBCBCBC).withOpacity(opacity);
    }
  }

  Color greyBlackColor(double opacity) {
    try {
      return Color(int.parse((SharedPref.isThemeIsDarkMode() ? appThemeColor.appThemeColor.colors.darkMode.theme.greyBlackColor : appThemeColor.appThemeColor.colors.lightMode.theme.greyBlackColor).replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFF83807F).withOpacity(opacity);
    }
  }

  Color greyLightColor(double opacity) {
    try {
      return Color(int.parse((SharedPref.isThemeIsDarkMode() ? appThemeColor.appThemeColor.colors.darkMode.theme.greyLightColor : appThemeColor.appThemeColor.colors.lightMode.theme.greyLightColor).replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFECECEC).withOpacity(opacity);
    }
  }

  Color greenColor(double opacity) {
    try {
      return Color(int.parse((SharedPref.isThemeIsDarkMode() ? appThemeColor.appThemeColor.colors.darkMode.theme.greenColor : appThemeColor.appThemeColor.colors.lightMode.theme.greenColor).replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFF4CAF50).withOpacity(opacity);
    }
  }

  Color yellowColor(double opacity) {
    try {
      return Color(int.parse((SharedPref.isThemeIsDarkMode() ? appThemeColor.appThemeColor.colors.darkMode.theme.yellowColor : appThemeColor.appThemeColor.colors.lightMode.theme.yellowColor).replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFF07C564).withOpacity(opacity);
    }
  }
  Color blueColor(double opacity) {
    try {
      return Color(int.parse((SharedPref.isThemeIsDarkMode() ? appThemeColor.appThemeColor.colors.darkMode.theme.blueColor : appThemeColor.appThemeColor.colors.lightMode.theme.blueColor).replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFF0000FF).withOpacity(opacity);
    }
  }

//#endregion app Fonts colors
}
