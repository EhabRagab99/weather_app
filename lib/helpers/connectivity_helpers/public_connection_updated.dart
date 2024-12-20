import 'package:iem_app/provider/public_providers.dart';

class PublicConnectionUpdated {
  static publicWhenConnectionUpdated() {
    if (!PublicProviders.connectivityInitProvider.hasConnection) {
      // connection back
    //   ShowToastFunctions.showToast(
    //     context: AlphaWeatherAPP.navigatorKey.currentState!.overlay!.context,
    //     margin: SizeConfig.height * 0.03,
    //     msg: 'offlineConnect'.tr,
    //   );
    // } else {
    //   // show connection is not found
    //   ShowToastFunctions.showToast(
    //     context: AlphaWeatherAPP.navigatorKey.currentState!.overlay!.context,
    //     margin: SizeConfig.height * 0.03,
    //     msg: 'onlineConnect'.tr,
    //     toastType: ToastType.success,
    //   );
    }
  }
}
