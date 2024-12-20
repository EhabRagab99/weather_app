import 'package:iem_app/helpers/popup_helpers/toast_helpers.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:flutter/material.dart';

class ColorHelper{

  static Color getToastColor(ToastType toastType){

    switch (toastType){
      case ToastType.success :
        return ColorConfig().greenColor(1);
      case ToastType.error :
        return  ColorConfig().redColor(1) ;
      case ToastType.warning:
        return ColorConfig().greyColor(1) ;
      default:
        return ColorConfig().primaryColor(1);
    }
  }
}