// import 'package:iem_app/helpers/notifications_helper.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class CommentOnMessage {
//   NotificationsHelper notificationsHelper = NotificationsHelper();
//
//   CommentOnMessage(BuildContext context) {
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
//     // LocalNotificationsConfig.showLocalNotification(id:commentNotificationModel.payload,title:commentNotificationModel.title  );
//     // notificationsHelper.listen();
//   }
// }
