import 'package:iem_app/helpers/info_helpers/app_info_store.dart';

class CheckAppVersion {
  static bool showAndroidUpdatePopUp = false;
  static bool showIosUpdatePopUp = false;

  CheckAppVersion._();

  late int firstFromApi;
  late int secondFromApi;
  late int thirdFromApi;
  late int firstFromStore;
  late int secondFromApiStore;
  late int thirdFromApiStore;

  static getVersion() async {
    await AppInfoFromStore.getAppInformationFromStore();
  }
}
