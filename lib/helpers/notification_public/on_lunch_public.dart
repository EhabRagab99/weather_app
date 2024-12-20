// import 'package:iem_app/helpers/notifications_helper.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class PublicOnLunch {
//   NotificationsHelper notificationsHelper = NotificationsHelper();
//
//   PublicOnLunch(BuildContext context) {
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
//   /// on OnLunch Public
//   onLunch(
//       {required BuildContext context, required RemoteMessage message}) async {
//     // await Future.delayed(const Duration(seconds: 5));
//
//     // commentNotificationModel=CommentNotificationModel.fromJson(message.data);
//     // notificationsHelper.listen();
//
//     /// action
//   }
// }
