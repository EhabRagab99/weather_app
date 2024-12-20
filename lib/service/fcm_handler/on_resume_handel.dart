// import 'package:iem_app/helpers/notification_public/on_resume_public.dart';
// import 'package:iem_app/helpers/notifications_helper.dart';
// // import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class OnResumeNotificationHandel {
//   NotificationsHelper notificationsHelper = NotificationsHelper();
//
//   OnResumeNotificationHandel(BuildContext context) {
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
//         PublicOnResume(context).onResume(
//           context: context,
//           message: message,
//         );
//         debugPrint("notification is public");
//         break;
//
//       case 2: // => comment notification
//         PublicOnResume(context).onResume(
//           context: context,
//           message: message,
//         );
//         debugPrint("notification is comment");
//         break;
//     }
//   }
// }
