import 'dart:io';

import 'package:flutter/material.dart';

class SizeConfig extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;



  static double width = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.last).size.width;
  static double height = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.last).size.height;
  static double bottomPadding = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.last).viewPadding.bottom;
  static double topPadding = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.last).viewPadding.top;
  static double textScale=MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.last).textScaleFactor;


  const SizeConfig({
    super.key,
    this.mobile,
    this.tablet,
    this.desktop,
  });


  // This isMobile, isTablet, isDesktop help us later
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 700;

  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width >= 700 && MediaQuery.of(context).size.width <= 1100;

  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1100;

  static bool keyboardIsVisible(BuildContext context){
    if(Platform.isAndroid){
      return WidgetsBinding.instance.platformDispatcher.views.last.viewInsets.bottom> 0.0;
    }
    else if(Platform.isIOS){
      return MediaQuery.of(context).padding.bottom<1;
    }
    return false;
  }

  //#region headline 1 Size
  static double headline1Size = SizeConfig.height * 0.03; //28px
//#endregion

  //#region headline 2 Size
  static double headline2Size = SizeConfig.height * .0193; //18 px
//#endregion

  //#region headline 3 Size
  static double headline3Size = SizeConfig.height * 0.017; //16 px
//#endregion


  //#region headline 4 Size
  static double headline4Size = SizeConfig.height * 0.015; //14 px
//#endregion

  //#region headline 5 Size
  static double headline5Size = SizeConfig.height * 0.0129; //12 px
//#endregion

  //#region headline 6 Size
  static double headline6Size = SizeConfig.height * 0.0107; //10 px
//#endregion



  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    // If our width is more than 1100 then we consider it a desktop
    if (size.width >= 1100) {
      return desktop!;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    else if (size.width >= 850 && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else {
      return mobile!;
    }
  }
}

double calculateSp(double fontSize,double textScaleFactor) {

  final spValue = (fontSize / textScaleFactor);
  return spValue;
}
