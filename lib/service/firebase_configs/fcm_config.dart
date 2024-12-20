// // ignore_for_file: use_build_context_synchronously
//
// import 'package:iem_app/service/fcm_handler/badge_count_handle.dart';
// import 'package:iem_app/service/fcm_handler/on_receive_notification_handel.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
//
//
// enum FcmTypeEnum {onMessage,onResume,onLaunch,}
//
// class FcmConfig{
//   static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
//
//   static getMainNotificationHandel(BuildContext context) async {
//
//     NotificationSettings settings = await firebaseMessaging.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       carPlay: true,
//       criticalAlert: true,
//       provisional: true,
//       sound: true,
//     );
//
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       debugPrint('User granted permission');
//     }
//     else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
//       debugPrint('User granted provisional permission');
//     }
//     else {
//       debugPrint('User declined or has not accepted permission');
//     }
//
//     // when app open
//     FirebaseMessaging.onMessage.listen((RemoteMessage message){
//       OnReceiveNotificationHandler(context: context).onReceiveNotification(context: context, message: message, fcmTypeEnum: FcmTypeEnum.onMessage);
//     });
//
//     // when app on background
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
//       OnReceiveNotificationHandler(context: context).onReceiveNotification(context: context, message: message, fcmTypeEnum: FcmTypeEnum.onResume);
//     });
//
//   }
//
//
//   //when app on Background
//   static Future<void> onBackgroundAppHandel(RemoteMessage message) async {
//     await Firebase.initializeApp();
//
//     BadgeCountHandle.initPlatformState();
//     BadgeCountHandle.addBadgeCount(count: int.parse(message.data['badge']));
//     debugPrint('Handling a background message ${message.messageId}');
//   }
//
//   //when app closed
//   static Future<void> onLunchAppHandel(BuildContext context) async {
//     await Firebase.initializeApp();
//     // await Future.delayed( const Duration(seconds: 5));
//      await FirebaseMessaging.instance.getInitialMessage().then((value) {
//       if (value != null) {
//         OnReceiveNotificationHandler(context: context).onReceiveNotification(context: context, message: value, fcmTypeEnum: FcmTypeEnum.onLaunch);
//         debugPrint("Handling a background message : ${value.toMap().toString()}");
//       }
//     });
//
//   }
// }
