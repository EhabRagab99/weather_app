import 'package:iem_app/pages/splash/provider/helper/check_first_time.dart';

class CheckVersionAvailability {
  /// check if have new update or not
  static checkAppVersionUpdate() async {
    await CheckFirstTimeApp.checkFirstTime();
  }
}
