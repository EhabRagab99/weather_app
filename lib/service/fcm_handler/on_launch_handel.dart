// import 'package:iem_app/helpers/notification_comment/on_lunch_comment.dart';
// import 'package:iem_app/helpers/notification_public/on_lunch_public.dart';
// import 'package:iem_app/helpers/notifications_helper.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class OnLunchNotificationHandel {
//   NotificationsHelper notificationsHelper = NotificationsHelper();
//
//   OnLunchNotificationHandel(BuildContext context) {
//     notificationsHelper =
//         Provider.of<NotificationsHelper>(context, listen: false);
//   }
//
//   getNotification({
//     required BuildContext context,
//     required RemoteMessage message,
//     required int notifyKey,
//   }) {
//     switch (notifyKey) {
//       case 1: // => public notification
//         PublicOnLunch(context).onLunch(
//           context: context,
//           message: message,
//         );
//         debugPrint("notification is public");
//         break;
//
//       case 2: // => comment notification
//         CommentOnLunch(context).onLunch(
//           context: context,
//           message: message,
//         );
//         debugPrint("notification is comment");
//         break;
//     }
//   }
// }
