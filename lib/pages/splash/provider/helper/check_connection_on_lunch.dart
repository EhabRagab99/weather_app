import 'package:iem_app/helpers/connectivity_helpers/connectivity_init_provider.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_theme_provider.dart';
import 'package:iem_app/main.dart';
import 'package:iem_app/pages/splash/provider/helper/splash_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

class CheckConnectionOnLunch {

  static checkHaveConnectionOnLunch({required BuildContext context}) async {
    initializeDateFormatting();

    ColorConfig.appThemeColor = Provider.of<AppThemeProvider>(AlphaWeatherAPP.navigatorKey.currentState!.overlay!.context, listen: false,);

    /// if have connection
    if (AlphaWeatherAPP.navigatorKey.currentState!.overlay!.context.read<ConnectivityInitProvider>().hasConnection) {
    }
    /// no connection
    else {
      await AlphaWeatherAPP.navigatorKey.currentState!.overlay!.context.read<SplashProvider>().setConnectionCheckedBefore(checked: true);
    }
  }
}
