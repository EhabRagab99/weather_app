// import 'package:iem_app/helpers/notifications_helper.dart';
// import 'package:iem_app/service/fcm_handler/on_launch_handel.dart';
// import 'package:iem_app/service/fcm_handler/on_message_handel.dart';
// import 'package:iem_app/service/fcm_handler/on_resume_handel.dart';
// import 'package:iem_app/service/firebase_configs/fcm_config.dart';
// // import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';
//
// class OnReceiveNotificationHandler {
//   NotificationsHelper notificationsHelper = NotificationsHelper();
//
//   OnReceiveNotificationHandler({
//     required BuildContext context,
//   }) {
//     notificationsHelper =
//         Provider.of<NotificationsHelper>(context, listen: false);
//   }
//
//   onReceiveNotification(
//       {required BuildContext context,
//       required RemoteMessage message,
//       required FcmTypeEnum fcmTypeEnum}) async {
//     int notifyKey = int.parse(message.data['NotifyKey']);
//     String notificationTitle = message.notification!.title.toString();
//     String notificationMessage = message.notification!.body!.toString();
//
//     notificationsHelper.setNotificationKey(key: notifyKey);
//     notificationsHelper.setNotificationTitle(title: notificationTitle);
//     notificationsHelper.setNotificationBody(body: notificationMessage);
//
//     if (fcmTypeEnum == FcmTypeEnum.onMessage) {
//       OnMessageNotificationHandel(context).getNotification(
//           context: context, message: message, notifyKey: notifyKey);
//       debugPrint('onMessage data is : ${message.data.toString()}');
//     } else if (fcmTypeEnum == FcmTypeEnum.onResume) {
//       OnResumeNotificationHandel(context).getNotification(
//           context: context, message: message, notifyKey: notifyKey);
//       debugPrint('onResume data is : ${message.data.toString()}');
//     } else if (fcmTypeEnum == FcmTypeEnum.onLaunch) {
//       OnLunchNotificationHandel(context).getNotification(
//           context: context, message: message, notifyKey: notifyKey);
//       debugPrint('onLaunch data is : ${message.data.toString()}');
//     }
//   }
// }
