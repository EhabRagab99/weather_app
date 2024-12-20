import 'package:iem_app/helpers/app_localizations.dart';
import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/color_helper.dart';
import 'package:iem_app/helpers/popup_helpers/toast_helpers.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/utils/extensions/app_size_boxes.dart';
import 'package:iem_app/widgets/buttons.dart';
import 'package:iem_app/widgets/visible_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPopUpWidget extends StatelessWidget {
  final String titleText;
  final String descriptionText;

  final bool withTwoButton;
  final bool withCloseButton;

  final String oneButtonName;
  final String twoButtonName;

  final void Function() oneOnTap;
  final void Function() twoOnTap;
  final bool? hasCancelButton;

  const CustomPopUpWidget({
    Key? key,
    required this.titleText,
    required this.descriptionText,
    required this.withTwoButton,
    required this.oneButtonName,
    required this.twoButtonName,
    required this.oneOnTap,
    required this.twoOnTap,
    required this.withCloseButton,
    this.hasCancelButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.height * 0.15,
        bottom: SizeConfig.height * 0.15,
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Material(
          borderRadius: BorderRadius.circular(SizeConfig.height * 0.04),
          color: ColorConfig().whiteColor(1),
          child: Directionality(
            textDirection:
                AppLocalizations.of(context)!.locale.languageCode == 'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(SizeConfig.height * 0.01),
                  width: SizeConfig.height * 0.38,
                  decoration: const BoxDecoration(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.height * 0.02,
                      ),

                      /// title
                      Text(
                        AppLocalizations.of(context)!
                            .translate(titleText)
                            .toString(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                color: ColorConfig().blackColor(1),
                                fontWeight: FontWeight.bold),
                      ),

                      SizedBox(
                        height: SizeConfig.height * 0.02,
                      ),

                      /// description
                      Text(
                        AppLocalizations.of(context)!
                            .translate(descriptionText)
                            .toString(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                color: ColorConfig().greyBlackColor(1),
                                fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: SizeConfig.height * 0.04,
                      ),

                      /// one button
                      Container(
                        height: SizeConfig.height * 0.055,
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.height * 0.03),
                        child: CustomMainButton(
                          onPress: oneOnTap,
                          buttonText: oneButtonName,
                          elevation: 0,
                          onPressColor: ColorConfig().blackColor(0.5),
                          enabled: true,
                          backgroundColor: ColorConfig().primaryColor(1),
                          borderColor: ColorConfig().blackColor(1),
                          borderWidth: 0,
                          shadowColor: ColorConfig().primaryColor(1),
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: ColorConfig().whiteColor(1),
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.height * 0.02),

                      /// two button
                      Visibility(
                        visible: withTwoButton,
                        child: SizedBox(
                          height: SizeConfig.height * 0.055,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.height * 0.03),
                            child: CustomMainButton(
                              onPress: twoOnTap,
                              buttonText: twoButtonName,
                              elevation: 0,
                              onPressColor: ColorConfig().redColor(.5),
                              enabled: true,
                              backgroundColor: hasCancelButton == false
                                  ? ColorConfig().primaryColor(1)
                                  : Colors.transparent,
                              borderColor: hasCancelButton == false
                                  ? ColorConfig().primaryColor(1)
                                  : Colors.red,
                              borderWidth: 0,
                              shadowColor: ColorConfig().redColor(.2),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    color: hasCancelButton == false
                                        ? ColorConfig().whiteColor(1)
                                        : Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.height * 0.02,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomPopUpAction extends StatelessWidget {
  final String pupUpHeaderText;
  final String descriptionText;
  final ToastType toastType;
  final bool withCornerIcon;
  final int iconCountNumber;
  final VoidCallback dialogOnTab;
  const CustomPopUpAction({super.key, required this.descriptionText, required this.toastType, required this.pupUpHeaderText,this.withCornerIcon=true,this.iconCountNumber=0,required this.dialogOnTab,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: dialogOnTab,
      child: Center(
        child: Material(
          color: ColorHelper.getToastColor(toastType),
          borderRadius:  BorderRadius.circular(SizeConfig.height * 0.006,),
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: SizeConfig.height * 0.0044),
            child: Container(
              constraints: BoxConstraints(maxWidth: SizeConfig.height * 0.42, maxHeight: SizeConfig.height * 0.13,),
              alignment: AlignmentDirectional.centerStart,
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.008, vertical: SizeConfig.height * 0.01,),
              decoration: BoxDecoration(
                color: ColorConfig().whiteColor(1),
                borderRadius: BorderRadius.circular(SizeConfig.height * 0.006),
                boxShadow: [
                  BoxShadow(
                    color: ColorConfig().blackColor(0.3),
                    blurRadius: SizeConfig.height * 0.006,
                    offset: Offset(0, SizeConfig.height * 0.006),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pupUpHeaderText,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorHelper.getToastColor(toastType),),
                      ),

                      Badge(
                        label:  VisibleWidget(
                          visible: iconCountNumber!=0,
                          child: Text('$iconCountNumber',),
                        ),
                        offset: const Offset(1, -9),
                        backgroundColor: iconCountNumber!=0?Colors.white:Colors.transparent,
                        textColor: ColorConfig().primaryColor(1),
                        largeSize: SizeConfig.height * .023,
                        textStyle: Theme.of(context).textTheme.titleMedium,
                        child: CircleAvatar(
                          backgroundColor: ColorHelper.getToastColor(toastType),
                          child: SvgPicture.asset('assets/icons/compare_icon.svg',),
                        ),
                      ),
                    ],
                  ),

                  0.013.heightBox,

                  Flexible(
                    child: Text(
                      descriptionText,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(color: ColorConfig().blackColor(.6),),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
