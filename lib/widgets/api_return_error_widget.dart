import 'package:iem_app/helpers/app_size_config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorMsgWidget extends StatelessWidget {
  final String errorMsg;
  const ErrorMsgWidget({Key? key, required this.errorMsg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset(
      'assets/gif/no_internet2.json',
      height: SizeConfig.height * .3,
    ));
  }
}
