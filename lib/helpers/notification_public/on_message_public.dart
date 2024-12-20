// import 'package:iem_app/helpers/notifications_helper.dart';
// import 'package:iem_app/service/fcm_handler/local_notification_config.dart';
// // import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class PublicOnMessage {
//   NotificationsHelper notificationsHelper = NotificationsHelper();
//
//   PublicOnMessage(BuildContext context) {
//     notificationsHelper =
//         Provider.of<NotificationsHelper>(context, listen: false);
//   }
//
//   void myCallback(Function callback) {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       callback();
//     });
//   }
//
//   onMessage({
//     required BuildContext context,
//     required RemoteMessage message,
//   }) async {
//     // commentNotificationModel=CommentNotificationModel.fromJson(message.data);
//     // notificationsHelper.listen();
//     LocalNotificationsConfig(context).showLocalNotification();
//     // notificationsHelper.listen();
//   }
// }
