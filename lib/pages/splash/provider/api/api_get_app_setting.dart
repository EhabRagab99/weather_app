import 'package:iem_app/pages/splash/model/app_setting_by_group_model.dart';
import 'package:iem_app/service/api_handler/general_api_state.dart';

class ApiGetAppSetting extends GeneralApiState {
  static final ApiGetAppSetting controller = ApiGetAppSetting._internal();
  factory ApiGetAppSetting() {
    return controller;
  }
  ApiGetAppSetting._internal();

  AppSettingByGroupModel appSettingByGroupModel=AppSettingByGroupModel.fromJson({});

}
