import 'package:flutter/foundation.dart';

class NotificationsHelper extends ChangeNotifier {
  bool allowNotifications = true;

  bool showNotifications = true;
  bool showNotificationLoadingWaiting = false;

  int notificationKey = 0;
  String notificationTitle = "";
  String notificationBody = "";
  String notificationPayload = "";

  bool inboxHaveNewMessage = false;

  bool isSinglePage = false;
  int adIdOpening = -1;

  changeIsSinglePage({required bool singlePage, required int adId}) {
    adIdOpening = adId;
    isSinglePage = singlePage;
    if (kDebugMode) {

    }
    notifyListeners();
  }

  disposeIsSinglePage(bool singlePage) {
    adIdOpening = -1;
    isSinglePage = singlePage;
    if (kDebugMode) {

    }
  }

  changeAllowNotifications(bool allow) {
    allowNotifications = allow;
    // UserDataFromStorage.setAllowNotifications(allow);
    notifyListeners();
  }

  setShowNotificationLoadingWaiting({required bool waiting}) {
    showNotificationLoadingWaiting = waiting;
    notifyListeners();
  }

  changeShowNotifications(bool allow) {
    showNotifications = allow;
    notifyListeners();
  }

  setInboxHaveNotification(bool have) {
    inboxHaveNewMessage = have;
    notifyListeners();
  }

  // notification data
  setNotificationKey({required int key}) {
    notificationKey = key;
    notifyListeners();
  }

  setNotificationTitle({required String title}) {
    notificationTitle = title;
    notifyListeners();
    notifyListeners();
  }

  setNotificationBody({required String body}) {
    notificationBody = body;
    notifyListeners();
    notifyListeners();
    notifyListeners();
  }

  setNotificationPayload({required String payload}) {
    notificationPayload = payload;
    notifyListeners();
  }

  listen() async {
    notifyListeners();
  }
}
