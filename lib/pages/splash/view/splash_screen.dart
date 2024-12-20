import 'package:iem_app/helpers/app_localizations.dart';
import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/connectivity_helpers/connectivity_init_provider.dart';
import 'package:iem_app/helpers/info_helpers/device_app_helper.dart';
import 'package:iem_app/helpers/routes_handler/material_navigation.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_theme_provider.dart';
import 'package:iem_app/main.dart';
import 'package:iem_app/pages/bar_home/controller/api/api_get_weather.dart';
import 'package:iem_app/pages/bar_home/view/bar_home_screen.dart';
import 'package:iem_app/pages/splash/provider/helper/check_connection_on_lunch.dart';
import 'package:iem_app/pages/splash/provider/helper/splash_provider.dart';
import 'package:iem_app/pages/splash/provider/helper/version_availability.dart';
import 'package:iem_app/widgets/general_app_background.dart';
import 'package:iem_app/widgets/loading/loading_widget.dart';
import 'package:iem_app/widgets/visible_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SplashScreenClass extends StatefulWidget {
  const SplashScreenClass({super.key});

  @override
  State<StatefulWidget> createState() {
    return SplashClass();
  }
}

class SplashClass extends State<SplashScreenClass> {

  lunchApp({required BuildContext context}) async {

    CheckConnectionOnLunch.checkHaveConnectionOnLunch(context: context);

    await CheckVersionAvailability.checkAppVersionUpdate();
    AlphaWeatherAPP.navigatorKey.currentState!.overlay!.context.read<AppThemeProvider>().getAppConfigResponse();
    AlphaWeatherAPP.navigatorKey.currentState?.overlay?.context.read<AppThemeProvider>().statusBarTheme();
    customPushAndRemoveUntil(AlphaWeatherAPP.navigatorKey.currentState!.overlay!.context, const BarHomeScreen());
    await ApiGetWeather().apiGetWeather(context: AlphaWeatherAPP.navigatorKey.currentState!.overlay!.context);

  }

  @override
  void initState() {
    super.initState();
    DeviceAppInformation.getDevicePlatform();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (mounted) {
        Provider.of<SplashProvider>(context, listen: false).setIsSplashScreen(splash: true);
        Provider.of<SplashProvider>(context, listen: false).setConnectionCheckedBefore(checked: false);
        Provider.of<ConnectivityInitProvider>(context, listen: false).initConnectivity(context: context);
        lunchApp(context: context);
      }
    });
  }

  @override
  void deactivate() async {
    await Provider.of<SplashProvider>(context, listen: false).disposeIsSplashScreen(splash: false);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final connectivityInitProvider = Provider.of<ConnectivityInitProvider>(context);
    return Scaffold(
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: !connectivityInitProvider.hasConnection ?
        Stack(
          alignment: Alignment.center,
          children: [
            VisibleWidget(
              visible: !connectivityInitProvider.hasConnection,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // gif
                  SizedBox(
                    width: SizeConfig.height * 0.3,
                    height: SizeConfig.height * 0.3,
                    child: Lottie.asset(
                      "assets/gif/error.json",
                      fit: BoxFit.contain,
                    ),
                  ),

                  //text No internet connection
                  Padding(
                    padding: EdgeInsets.only(
                      top: SizeConfig.height * 0.02,
                      left: SizeConfig.height * 0.004635,
                      right: SizeConfig.height * 0.004635,
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.translate('offlineConnect').toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // circles background
          ],
        ) : GeneralAppBackground(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const Spacer(),
                Image.asset('assets/images/alpha_logo.png', height: 200, width: 200,),
                const Spacer(),
                 LoadingAnimationWidget(
                  color: ColorConfig().whiteColor(1),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
