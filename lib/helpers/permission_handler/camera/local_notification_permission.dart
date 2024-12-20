// import 'dart:io';
//
// import 'package:iem_app/service/fcm_handler/local_notification_config.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class LocalNotificationPermissionHandel {
//
//   static  isAndroidPermissionGranted({required BuildContext context}) async {
//     if (Platform.isAndroid) {
//       final bool granted = await LocalNotificationsConfig(context).flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.areNotificationsEnabled() ?? false;
//
//       if (kDebugMode) {
//         print(granted);
//       }
//     }
//   }
//
//   static  requestPermissions({required BuildContext context}) async {
//     if (Platform.isIOS || Platform.isMacOS) {
//       await LocalNotificationsConfig(context).flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
//         alert: true,
//         badge: true,
//         sound: true,
//       );
//     } else if (Platform.isAndroid) {
//       final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
//       LocalNotificationsConfig(context).flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
//       final bool? granted = await androidImplementation?.requestPermission();
//       if (kDebugMode) {
//         print(granted);
//       }
//     }
//   }
//   static  web({required BuildContext context}) async {
//     if (Platform.isIOS || Platform.isMacOS) {
//       await LocalNotificationsConfig(context).flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
//         alert: true,
//         badge: true,
//         sound: true,
//       );
//     } else if (Platform.isAndroid) {
//       final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
//       LocalNotificationsConfig(context).flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
//       final bool? granted = await androidImplementation?.requestPermission();
//       if (kDebugMode) {
//         print(granted);
//       }
//     }
//   }
//
// }
//
//
//
//
