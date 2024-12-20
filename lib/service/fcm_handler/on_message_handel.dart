// import 'package:iem_app/helpers/notification_comment/on_message_comment.dart';
// import 'package:iem_app/helpers/notification_public/on_message_public.dart';
// import 'package:iem_app/helpers/notifications_helper.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';
//
// class OnMessageNotificationHandel {
//   NotificationsHelper notificationsHelper = NotificationsHelper();
//
//   OnMessageNotificationHandel(BuildContext context) {
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
//         PublicOnMessage(context).onMessage(
//           context: context,
//           message: message,
//         );
//         debugPrint("notification is public");
//         break;
//
//       case 2: // => comment notification
//         CommentOnMessage(context).onMessage(
//           context: context,
//           message: message,
//         );
//         debugPrint("notification is comment");
//         break;
//     }
//   }
// }
