import 'package:iem_app/helpers/connectivity_helpers/connectivity_init_provider.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_theme_provider.dart';
import 'package:iem_app/pages/bar_home/controller/provider/home_provider.dart';
import 'package:iem_app/pages/splash/provider/helper/splash_provider.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/provider/localization_provider.dart';
import 'package:iem_app/service/api_handler/general_api_state.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider.value(value: LoadingProviderClass()),
  ChangeNotifierProvider.value(value: LocalizationProvider()),
  ChangeNotifierProvider.value(value: AppThemeProvider()),
  ChangeNotifierProvider.value(value: ConnectivityInitProvider()),
  ChangeNotifierProvider.value(value: GeneralApiState()),
  ChangeNotifierProvider.value(value: SplashProvider()),
  ChangeNotifierProvider.value(value: HomeProvider()),
];
