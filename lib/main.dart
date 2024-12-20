import 'dart:async';
import 'dart:developer';

import 'package:iem_app/helpers/app_localizations.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_theme_provider.dart';
import 'package:iem_app/navigator_observer.dart';
import 'package:iem_app/pages/splash/view/splash_screen.dart';
import 'package:iem_app/provider/generate_public_providers.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/provider/localization_provider.dart';
import 'package:iem_app/provider/multi_providers.dart';
import 'package:iem_app/provider/public_providers.dart';
import 'package:iem_app/service/api_handler/amnco_endpoints.dart';
import 'package:iem_app/utilites/shared_preferences/shared_obj.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  
  await SharedPreferences.getInstance();

  // await UserDataFromStorage.getData();
  await SharedObj().init();

  // await ApiGetApiKey().getApiKey();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(

    const SystemUiOverlayStyle(
      /// top status bar icon for ios color
      statusBarBrightness: Brightness.light,
      ///top status bar icon for android color
      statusBarIconBrightness: Brightness.light,
      /// bottom bar button icon for android color
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
    ),
  );


  // LocalizationProvider appLanguage = LocalizationProvider();
  // await appLanguage.fetchLocalization();
  // FirebaseMessaging.instance.getToken().then((value) {
  //   // String? token = value;
  //
  // });

  log("Current Environment is::: ${AmncoBaseServerUrl.singletonUrl.environmentName}");
  Future.delayed(const Duration(seconds: 2),(){
    runApp(MultiProvider(
      providers: providers,
      child:const AlphaWeatherAPP(),
    ),);
  });


}

class AlphaWeatherAPP extends StatefulWidget {

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


  const AlphaWeatherAPP({super.key}) ;

  @override
  State<AlphaWeatherAPP> createState() => _AlphaWeatherAPPState();

}


class _AlphaWeatherAPPState extends State<AlphaWeatherAPP> with WidgetsBindingObserver {


  void myCallback(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  @override
  initState(){
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_)async{
      if(mounted){
        GeneratePublicProviders.generatePublicProvidersOnLunch(context: context);
      }
    });
    super.initState();

  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {

    if (kDebugMode) {
      print("APP_STATE: $state");
    }

    if (state == AppLifecycleState.resumed) {

      if (kDebugMode) {
        print('on reswrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
      }
      
      // user returned to our app
    } else if (state == AppLifecycleState.inactive) {
      if (kDebugMode) {
        print(' app is actevvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv');
      }
      // app is inactive
    } else if (state == AppLifecycleState.paused) {
      // user quit our app temporally
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appSetting = Provider.of<AppThemeProvider>(context);
    final localizationProvider = Provider.of<LocalizationProvider>(context);

    // LocalizationProvider appLanguage = LocalizationProvider();
    localizationProvider.fetchLocalization();
    PublicProviders.loadingProviderClass=Provider.of<LoadingProviderClass>(context,);

    return Consumer<AppThemeProvider>(
      builder: (context, themeNotifier, child) {
        return WillPopScope(
          onWillPop: ()async=> false,
          child: MaterialApp(
            navigatorKey: AlphaWeatherAPP.navigatorKey,
            title: "Alpha Weather APP" ,
            debugShowCheckedModeBanner: AmncoBaseServerUrl.singletonUrl != MyUrl.baseProduction &&
                AmncoBaseServerUrl.singletonUrl != MyUrl.basePreProdUrl,
            themeMode: appSetting.theMode,
            locale: localizationProvider.appLocal,
            // locale:  const Locale('ar', ''),
            supportedLocales: const [
              Locale('ar', ''), // arabic, no country code
              Locale('en', ''), // English, no country code
              
            ],
            navigatorObservers: [
              AppNavObserver()
            ],

            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              // FileViewLocalizationsDelegate.delegate,
            ],
            theme: ThemeData(
              fontFamily:"Tajawal",
              primaryColor: ColorConfig().primaryColor(1),
              scaffoldBackgroundColor: ColorConfig().scaffoldBackgroundColor(1),
              brightness: Brightness.light,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent ,
              dividerColor: ColorConfig().dividerColor(1),
              cardColor: ColorConfig().scaffoldBackgroundColor(1),
              secondaryHeaderColor: ColorConfig().scaffoldBackgroundColor(1),
              appBarTheme: AppBarTheme(
                backgroundColor: ColorConfig().appbarBackgroundColor(1),
              ),
              textTheme:appSetting.textTheme,
              bottomAppBarTheme: BottomAppBarTheme(color: ColorConfig().scaffoldBackgroundColor(1)),
              colorScheme: ColorScheme.light(secondary:ColorConfig().primaryColor(1)).copyWith(
                primary: Colors.blue, background: ColorConfig().scaffoldBackgroundColor(1),
              ),
            ),
            darkTheme:ThemeData(
              fontFamily:"Poppins",
              primaryColor: ColorConfig().primaryColor(1),
              scaffoldBackgroundColor: ColorConfig().scaffoldBackgroundColor(1),
              brightness: Brightness.dark,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              dividerColor: ColorConfig().dividerColor(1) ,
              appBarTheme: AppBarTheme(
                backgroundColor: ColorConfig().appbarBackgroundColor(1),
              ),
              cardColor: ColorConfig().scaffoldBackgroundColor(1),
              secondaryHeaderColor: ColorConfig().scaffoldBackgroundColor(1),
              textTheme:appSetting.textTheme,
              bottomAppBarTheme: BottomAppBarTheme(color: ColorConfig().scaffoldBackgroundColor(1)),
              colorScheme: ColorScheme.dark(secondary:ColorConfig().primaryColor(1),).copyWith(primary: Colors.blue,
                background: ColorConfig().scaffoldBackgroundColor(1),
              ),
            ),
            home: const ClipRRect(
              clipBehavior: Clip.antiAlias,
              child: SplashScreenClass(),
            ),
            // home: const SplashScreenClass(),
          ),
        );
      },
    );
  }
}
