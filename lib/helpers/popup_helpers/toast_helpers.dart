import 'package:iem_app/helpers/app_localizations.dart';
import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/utils/extensions/app_size_boxes.dart';
import 'package:iem_app/widgets/custom_toast/custom_toast_widget.dart';
import 'package:iem_app/widgets/custome_pop_up_widget/custom_popup_widget.dart';
import 'package:flutter/material.dart';
enum ToastType{
  success,
  error,
  warning
}
class ShowToastFunctions {
  ShowToastFunctions._();

  static showToast({
    required BuildContext context,
    required String msg,
    ToastType? toastType,
    double? margin = 0,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        // duration: const Duration(seconds: 2),
        content: CustomToastWidget(
          message: msg,
          toastType: toastType ?? ToastType.error,
        ),
        margin: EdgeInsetsDirectional.only(end: SizeConfig.height * 0.008, bottom: SizeConfig.height * 0.04),
        // margin: EdgeInsetsDirectional.symmetric(horizontal: SizeConfig.height * 0.00, vertical: SizeConfig.height * 0.06),
        elevation: 0,
        backgroundColor: ColorConfig().primaryColor(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(SizeConfig.height * 0.006,),
          ),
        ),
      ),
    );
  }

  static showCompareToast({
    required BuildContext context,
    bool hideWhenTap=true,
    required String toastHeaderText,
    required String descriptionText,
    ToastType toastType=ToastType.success,
    int iconCountNumber=0,
    bool withCornerIcon=false,
    required VoidCallback dialogOnTab,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        //duration: const Duration(seconds: 2),
        content: CustomPopUpAction(
          pupUpHeaderText: toastHeaderText,
          descriptionText: descriptionText,
          toastType: toastType,
          iconCountNumber: iconCountNumber,
          withCornerIcon: withCornerIcon,
          dialogOnTab: dialogOnTab,
        ),
        margin: EdgeInsetsDirectional.only(end: SizeConfig.height * 0.004, bottom: SizeConfig.height * 0.04),
        // margin: EdgeInsetsDirectional.symmetric(horizontal: SizeConfig.height * 0.00, vertical: SizeConfig.height * 0.06),
        elevation: 0,
        backgroundColor: ColorConfig().primaryColor(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(SizeConfig.height * 0.006),
          ),
        ),
      ),
    );
  }

  static showPublicConnectionToast({
    required BuildContext context,
    required String msg,
    required bool connected,
    double? margin = 0}) {

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              0.015.widthBox,

              Icon(
                connected ? Icons.wifi : Icons.wifi_off_sharp,
                color: ColorConfig().primaryColor(1),
              ),

              0.015.widthBox,

              Expanded(
                child: Text(
                  msg,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: ColorConfig().whiteColor(1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        elevation: 3,
        backgroundColor: connected ? ColorConfig().primaryColor(1) : ColorConfig().primaryColor(1),
        behavior: SnackBarBehavior.floating,
        padding: EdgeInsets.all(SizeConfig.height * 0.01),
        margin: EdgeInsets.only(
          bottom: SizeConfig.height * 0.04 + (margin!),
          left: AppLocalizations.of(context)!.locale.languageCode == 'en' ? (connected
              ? SizeConfig.height * 0.02
              : SizeConfig.height * 0.06
          ) :(connected ? SizeConfig.height * 0.07 : SizeConfig.height * 0.11),
          right: AppLocalizations.of(context)!.locale.languageCode == 'en' ?
          (connected ? SizeConfig.height * 0.02 : SizeConfig.height * 0.06) :
          (connected ? SizeConfig.height * 0.07 : SizeConfig.height * 0.11),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
      ),
    );
  }
  //
  // static showToastFromPackage(
  //     {required BuildContext context,
  //     required bool isTranslate,
  //     required String msg,
  //     double? margin = 0,
  //     bool withPadding = false}) {
  //   ShowToastFunctions.fToast.init(context);
  //   ShowToastFunctions.fToast.showToast(
  //     gravity: ToastGravity.BOTTOM,
  //     child: Padding(
  //       padding:
  //           !withPadding ? EdgeInsets.zero : const EdgeInsets.only(top: 80),
  //       child: Container(
  //         height: SizeConfig.height * .08,
  //         width: SizeConfig.width,
  //         alignment: Alignment.center,
  //         decoration: BoxDecoration(
  //           color: ColorConfig().primaryColor(1),
  //           borderRadius: BorderRadius.circular(25),
  //         ),
  //         margin: EdgeInsetsDirectional.only(bottom: margin ?? 0),
  //         child: CustomToastWidget(
  //           message: msg,
  //           isTranslate: isTranslate,
  //           withToPadding: true,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
