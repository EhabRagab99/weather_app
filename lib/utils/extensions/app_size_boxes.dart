import 'package:iem_app/helpers/app_size_config.dart';
import 'package:flutter/cupertino.dart';

extension SizeExtensionBox on num {
  Widget get widthBox => SizedBox(
    width: SizeConfig.height * this,
  );

  Widget get heightBox => SizedBox(
    height: SizeConfig.height * this,
  );
}
