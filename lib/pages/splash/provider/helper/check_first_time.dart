import 'package:iem_app/pages/splash/provider/helper/check_authorize.dart';

class CheckFirstTimeApp {

  /// check if have new update or not
  static checkFirstTime() async {
    await CheckAuthorizeUser.checkAuthorize();
  }
}
