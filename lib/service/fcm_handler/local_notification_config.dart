// // ignore_for_file: discarded_futures
//
// import 'package:iem_app/helpers/notification_comment/local_on_tap_comment.dart';
// import 'package:iem_app/helpers/notification_public/local_on_tap_public.dart';
// import 'package:iem_app/helpers/notifications_helper.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:provider/provider.dart';
//
// class LocalNotificationsConfig {
//   NotificationsHelper notificationsHelper=NotificationsHelper();
//
//   LocalNotificationsConfig(BuildContext context) {
//     notificationsHelper = Provider.of<NotificationsHelper>(context,listen: false );
//   }
//
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//
//   initializationNotificationSettings({required BuildContext context}) async {
//
//     var initializationSettingsDarwin =const  DarwinInitializationSettings(
//       defaultPresentAlert: true,
//       defaultPresentBadge: false,
//       defaultPresentSound: true,
//       requestAlertPermission: false,
//       requestBadgePermission: false,
//       requestSoundPermission: false,
//     );
//
//     var  initializationSettingsAndroid = const AndroidInitializationSettings(
//       '@drawable/ic_stat_group_1563',
//     );
//
//     InitializationSettings initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsDarwin,
//     );
//
//     flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: (val)=>localNotificationOnTap(context: context,notificationResponse: val),
//     );
//
//   }
//
//
//   void showLocalNotification() async {
//     await _showLocalNotificationPopUp();
//   }
//
//   Future<void> _showLocalNotificationPopUp() async {
//
//     var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       DateTime.now().microsecond.toString(),
//       notificationsHelper.notificationTitle.toString(),
//       importance: Importance.max,
//       playSound: true,
//       showProgress: false,
//       priority: Priority.high,
//       fullScreenIntent: true,
//       enableLights: true,
//       ticker: notificationsHelper.notificationTitle.toString(),
//       color: ColorConfig().primaryColor(1),
//       channelShowBadge: false,
//       enableVibration: true,
//
//     );
//     const DarwinNotificationDetails initializationSettingsDarwin = DarwinNotificationDetails(
//         presentBadge:true ,
//         presentAlert: true,
//         presentSound: true,
//     );
//
//     var platformChannelSpecifics = NotificationDetails(
//         android: androidPlatformChannelSpecifics,
//         iOS: initializationSettingsDarwin
//     );
//
//     await flutterLocalNotificationsPlugin.show(
//       DateTime.now().microsecond,
//       notificationsHelper.notificationTitle.toString(),
//       notificationsHelper.notificationBody.toString(),
//       platformChannelSpecifics,
//       payload: DateTime.now().microsecond.toString(),
//     );
//   }
//
//   Future localNotificationOnTap({required NotificationResponse? notificationResponse,required BuildContext context,}) async {
//
//     if (kDebugMode) {
//       print("00000000000000000000000000000000on ${notificationResponse!.payload}");
//     }
//
//     switch(notificationsHelper.notificationKey){
//       case 1:// => public
//         PublicLocalNotificationOnTap(context:context).onTap();
//         break;
//
//       case 2:// => comment
//         CommentLocalNotificationOnTap(context:context).onTap();
//         break;
//
//     }
//
//
//   }
//
// }
//
//
//
//
