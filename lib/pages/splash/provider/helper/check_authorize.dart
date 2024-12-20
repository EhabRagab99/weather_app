import 'package:iem_app/helpers/routes_handler/material_navigation.dart';
import 'package:iem_app/main.dart';
import 'package:iem_app/pages/bar_home/controller/api/api_get_weather.dart';
import 'package:iem_app/pages/bar_home/view/bar_home_screen.dart';

class CheckAuthorizeUser {

  /// check if have token saved in local storage
  static checkAuthorize() async {
    await Future.delayed(const Duration(seconds: 1));
    customPushAndRemoveUntil(
        AlphaWeatherAPP.navigatorKey.currentState!.overlay!.context,
        const BarHomeScreen());
    await ApiGetWeather().apiGetWeather(
        context: AlphaWeatherAPP.navigatorKey.currentState!.overlay!.context);
  }
}
