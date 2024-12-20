import 'package:iem_app/pages/splash/provider/helper/check_connection_on_lunch.dart';
import 'package:iem_app/provider/public_providers.dart';
import 'package:flutter/material.dart';

class SplashConnectionUpdated {
  static splashWhenConnectionUpdated({required BuildContext context}) async {
    if (PublicProviders.splashProvider.connectionCheckedBefore) {
      CheckConnectionOnLunch.checkHaveConnectionOnLunch(context: context);
    }
  }
}
