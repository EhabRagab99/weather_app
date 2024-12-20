import 'package:iem_app/helpers/notifications_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentLocalNotificationOnTap {
  NotificationsHelper notificationsHelper = NotificationsHelper();

  CommentLocalNotificationOnTap({
    required BuildContext context,
  }) {
    notificationsHelper =
        Provider.of<NotificationsHelper>(context, listen: false);
  }

  void myCallback(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  // when user click on local notification popup
  onTap() async {
    /// in SinglePage and refresh comment data and scroll
  }
}
