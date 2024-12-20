import 'dart:io';

import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;

class DeviceAppInformation {
  static String platform = '';
  static String deviceLanguageCode = 'ar';
  static int deviceTypeId = -1;

  static getDevicePlatform() {
    if (kIsWeb) {
      platform = 'web';
      deviceTypeId = 1;
    } else if (Platform.isAndroid) {
      platform = 'android';
      deviceTypeId = 2;
    } else if (Platform.isIOS) {
      platform = 'ios';
      deviceTypeId = 3;
    }
    if (kDebugMode) {
      print('platform type is $platform');
    }
  }

  static getDeviceLanguageCode() async {
    deviceLanguageCode =
        Platform.localeName.toString()[0] + Platform.localeName.toString()[1];
    if (kDebugMode) {
      print('device Language Code is $deviceLanguageCode');
    }
  }
}
