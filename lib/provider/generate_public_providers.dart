import 'package:iem_app/helpers/connectivity_helpers/connectivity_init_provider.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_theme_provider.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/provider/localization_provider.dart';
import 'package:iem_app/provider/public_providers.dart';
import 'package:iem_app/service/api_handler/general_api_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class GeneratePublicProviders {
  static generatePublicProvidersOnLunch({required BuildContext context}) {
    PublicProviders.appThemeProvider = Provider.of<AppThemeProvider>(
      context,
      listen: false,
    );
    PublicProviders.loadingProviderClass = Provider.of<LoadingProviderClass>(
      context,
      listen: false,
    );
    PublicProviders.localizationProvider = Provider.of<LocalizationProvider>(
      context,
      listen: false,
    );
    // PublicProviders.helperBottomBar=Provider.of<HelperBottomBar>(context,listen: false,);
    // PublicProviders.splashProvider=Provider.of<SplashProvider>(context,listen: false,);
    PublicProviders.connectivityInitProvider =
        Provider.of<ConnectivityInitProvider>(
      context,
      listen: false,
    );
    PublicProviders.generalApiState = Provider.of<GeneralApiState>(
      context,
      listen: false,
    );
  }
}
