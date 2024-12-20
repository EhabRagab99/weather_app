// ignore_for_file: discarded_futures

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';

class BadgeCountHandle {
  static String appBadgeSupported = 'Unknown';
  static bool isFocused = true;

  static initPlatformState() async {
    String appBadgeSupported;
    try {
      bool res = await FlutterAppBadger.isAppBadgeSupported();
      if (res) {
        appBadgeSupported = 'Supported';
      } else {
        appBadgeSupported = 'Not supported';
      }
    } on PlatformException {
      appBadgeSupported = 'Failed to get badge support.';
    }
    appBadgeSupported = appBadgeSupported;
    // PublicProviders.singleProductHelper.listen();
    return;
  }

  static addBadgeCount({required int count}) async {
    FlutterAppBadger.removeBadge();
    FlutterAppBadger.updateBadgeCount(count);
    // PublicProviders.singleProductHelper.listen();

    if (kDebugMode) {
      print("badge count willx set = $count");
    }
  }

  static removeBadgeAll() async {
    FlutterAppBadger.removeBadge();

    // PublicProviders.singleProductHelper.listen();
    if (kDebugMode) {
      print("badge count removed all ");
    }
  }
}
