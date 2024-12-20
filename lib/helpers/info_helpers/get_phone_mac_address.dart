import 'package:flutter/foundation.dart';
// import 'package:platform_device_id/platform_device_id.dart';

class GetDeviceId {
  static String? macAddress;

  static Future initPlatformState() async {
    // String? deviceId = await PlatformDeviceId.getDeviceId;
    String? deviceId ;
    macAddress = deviceId!;
    debugPrint("macAddress = ${macAddress.toString()}");
    return deviceId;
  }
}
